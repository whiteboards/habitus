import Ember from 'ember';
import DS from 'ember-data';
import ESASession from "ember-simple-auth/services/session";

export default ESASession.extend({

  store: Ember.inject.service(),

  currentUser: Ember.computed('isAuthenticated', function() {
    if (this.get('isAuthenticated')) {
      let user_id = JSON.parse(localStorage['ember_simple_auth:session']).authenticated.id
      const promise = this.get('store').findRecord('user', user_id)
      return DS.PromiseObject.create({ promise: promise });
    }
  })

});