import com.apihackday.Event
import com.apihackday.Survey

class BootStrap {

    def init = { servletContext ->
		Event event = new Event(name: 'Api HackDay')
		
		event.addToSurveys(new Survey(name: 'What your favorite API?', surveyType: 1)) //Vote
		event.addToSurveys(new Survey(name: 'Whats your favorite film?', surveyType: 1)) //Vote
		event.addToSurveys(new Survey(name: 'Which is your favorite city?', surveyType: 1)) //Vote
		
		event.addToSurveys(new Survey(name: 'Lets answer some questions', surveyType: 2)) //Vote

		event.save(flush: true)
		
		
    }
    def destroy = {
    }
}
