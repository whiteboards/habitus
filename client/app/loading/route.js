import Ember from 'ember';

export default Ember.Route.extend({
  actions: {
    error(error, transition) {
      if (error) {
        return this.transitionTo('error');
      }
    }
  }
});
