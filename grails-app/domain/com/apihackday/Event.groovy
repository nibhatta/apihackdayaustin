package com.apihackday

class Event {

	static expose = 'event'
	
	String name
	static hasMany = [surveys: Survey]
	
    static constraints = {
		name(blank: false)
    }

	String toString() {
		return name
	}
}
