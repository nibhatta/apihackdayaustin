package com.apihackday

import grails.converters.JSON

class TwilioSurveyController {

    def getTwilioSurveyResults = {
                def survey = Survey.get(1) as JSON
                
                render survey
        }
}
