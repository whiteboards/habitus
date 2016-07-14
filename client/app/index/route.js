import Ember from 'ember';

export default Ember.Route.extend({
  model() {
    return this.store.findRecord('page', 'index');
  },
  // session: Ember.inject.service('session'),
  actions: {
    
  },
  afterModel(model, transition) {
    if (model.get('alias') !== 'index') {
      this.transitionTo('admin');
    }
  }
})
