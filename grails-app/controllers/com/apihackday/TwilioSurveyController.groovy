package com.apihackday

import grails.converters.JSON

class TwilioSurveyController {
	
	def twilioService

    def getTwilioSurveyResults = {
                def survey = twilioService.callTwilio()
                render survey
     }
}
