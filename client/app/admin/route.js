import Ember from 'ember';

export default Ember.Route.extend({
  model() {
    return this.store.findAll('user');
  },
  actions: {
    error(error, transition) {
      if (error) {
        return this.transitionTo('admin.error');
      }
    }
  }
});
