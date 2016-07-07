import Ember from 'ember';

export default Ember.Route.extend({
  model() {
    return this.store.createRecord('page');
  },
  actions: {
    savePage(model) {
      model.save().then(()=> {
        console.log('we saved!')
        this.transitionTo('admin.pages');
      })
    }
  }
});
