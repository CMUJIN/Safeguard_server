package com.jinhs.fetch.handler;

import java.io.IOException;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.services.mirror.model.Location;
import com.google.api.services.mirror.model.Notification;
import com.jinhs.fetch.bo.NoteBo;
import com.jinhs.fetch.common.DataProcessHelper;
import com.jinhs.fetch.common.GeoCodingHelper;
import com.jinhs.fetch.mirror.MirrorClient;
import com.jinhs.fetch.transaction.DBTransService;

@Component
public class FetchFirstHandlerImpl implements FetchFirstHandler {
	private static final Logger LOG = Logger.getLogger(FetchFirstHandlerImpl.class.getSimpleName());
	
	@Autowired
	DBTransService transService;
	
	@Autowired
	DataProcessHelper dataProcessHelper;
	
	@Autowired
	MirrorClient mirrorClient;
	
	@Autowired
	GeoCodingHelper geoCodingHelper;
	
	@Autowired
	ZoneRateHandler zoneRateHandler;
	
	@Autowired
	InsertTimelineHandler insertTimelineHandler;
	
	@Override
	public void fetchFirst(Notification notification, Credential credential)
			throws IOException {
		LOG.info("Fetch First operation");
		Location location = mirrorClient.getUserLocation(credential);
		if(location==null){
			LOG.info("Location load failed");
			throw new IOException();
		}
		
		NoteBo firstNote = transService.fetchFirstNoteByCoordinate(location.getLatitude(), location.getLongitude());
		if(firstNote!=null)
			insertTimelineHandler.insertFetchFirst(credential, firstNote);
		else
			insertTimelineHandler.insertNoFirstNoteAvaliable(credential);
		LOG.info("Fetch First finish");
	}

}