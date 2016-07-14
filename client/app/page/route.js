import Ember from 'ember';
export default Ember.Route.extend({
  model(params) {
    return this.store.findRecord('page', params.page_alias);
  },
  afterModel(model, transition) {
    if (model.get('alias') === 'index') {
      this.transitionTo('/');
    }
  },
  actions: {
    saveComment(model) {
      model.save().then(()=> {
        console.log('we saved!')
      })
    }
  }
});
