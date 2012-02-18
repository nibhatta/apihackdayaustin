package com.apihackday

/*import grails.converters.*
import groovyx.net.http.*
import static groovyx.net.http.ContentType.*
import static groovyx.net.http.Method.**/

import java.util.Random

class TwilioService {
	
	Random rand = new Random()
	
	

    def callTwilio() {
		
		
		/*def http = new HTTPBuilder("https://ACaceb8a3bd4e64cbb865a9eaa672b619d:b869c3f23c058cfc845954543f03e609@api.twilio.com/2010-04-01/Accounts/ACaceb8a3bd4e64cbb865a9eaa672b619d/SMS/Messages.json")

				 http.request(GET, JSON) {
					response.success = { resp, json ->
						return json
					}
				}*/
		return '[{\"candidate\":\"one\", \"votes\": \"'+ createRandom() + '\"}, {\"candidate\":\"two\", \"votes\": \"'+ createRandom() + '\"}, {\"candidate\":\"three\", \"votes\": \"'+ createRandom() + '\"}, {\"candidate\":\"four\", \"votes\": \"'+ createRandom() + '\"}]'
    }

	int createRandom() {
		return rand.nextInt(40)
	}
}
