class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}
		
		"/twiliosurvey" (controller: "twilioSurvey") {
		                        action = [GET:"getTwilioSurveyResults"]
		                }

		"/"(view:"/index")
		"500"(view:'/error')
	}
}
