package com.apihackday



import org.junit.*
import grails.test.mixin.*

@TestFor(SurveyController)
@Mock(Survey)
class SurveyControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/survey/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.surveyInstanceList.size() == 0
        assert model.surveyInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.surveyInstance != null
    }

    void testSave() {
        controller.save()

        assert model.surveyInstance != null
        assert view == '/survey/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/survey/show/1'
        assert controller.flash.message != null
        assert Survey.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/survey/list'


        populateValidParams(params)
        def survey = new Survey(params)

        assert survey.save() != null

        params.id = survey.id

        def model = controller.show()

        assert model.surveyInstance == survey
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/survey/list'


        populateValidParams(params)
        def survey = new Survey(params)

        assert survey.save() != null

        params.id = survey.id

        def model = controller.edit()

        assert model.surveyInstance == survey
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/survey/list'

        response.reset()


        populateValidParams(params)
        def survey = new Survey(params)

        assert survey.save() != null

        // test invalid parameters in update
        params.id = survey.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/survey/edit"
        assert model.surveyInstance != null

        survey.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/survey/show/$survey.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        survey.clearErrors()

        populateValidParams(params)
        params.id = survey.id
        params.version = -1
        controller.update()

        assert view == "/survey/edit"
        assert model.surveyInstance != null
        assert model.surveyInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/survey/list'

        response.reset()

        populateValidParams(params)
        def survey = new Survey(params)

        assert survey.save() != null
        assert Survey.count() == 1

        params.id = survey.id

        controller.delete()

        assert Survey.count() == 0
        assert Survey.get(survey.id) == null
        assert response.redirectedUrl == '/survey/list'
    }
}
