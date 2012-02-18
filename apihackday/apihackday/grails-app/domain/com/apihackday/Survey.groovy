package com.apihackday

class Survey {

	static expose = 'survey'
	
	String name
	boolean isClosed
	int surveyType = 1//1 is SelectFavorite, 2 is Scale
	static belongsTo = [event: Event]
	//Event event
	
    static constraints = {
		name(blank: false)
		surveyType(min: 1, max: 2)
    }
}
