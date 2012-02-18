import com.apihackday.Event
import com.apihackday.Survey

class BootStrap {

    def init = { servletContext ->
		Event eventApiHackDay = new Event(name: 'Api HackDay')
		//eventApiHackDay.addToSurveys(new Survey(name: 'Show me love', surveyType: 2))
		//eventApiHackDay.addToSurveys(new Survey(name: 'Whos the best', surveyType: 1))

		eventApiHackDay.save(flush: true)
		
		
    }
    def destroy = {
    }
}
