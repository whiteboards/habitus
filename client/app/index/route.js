import Ember from 'ember';

export default Ember.Route.extend({
  model() {
    return this.store.findRecord('page', 'index');
  },
  actions: {
    error(error, transition) {
      if (error) {
        return this.transitionTo('admin');
      }
    }
  },
  afterModel(model, transition) {
    if (model.get('alias') !== 'index') {
      this.transitionTo('admin');
    }
  }
})
