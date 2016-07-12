import Ember from 'ember';

export default Ember.Route.extend({
  model() {
    return this.store.createRecord('user');
  },
  actions: {
    cancel() {
      this.sendAction('cancel')
    },
    saveUser(model) {
      model.save().then(()=> {
        console.log('we saved!')
        this.transitionTo('admin.users');
      })
    }
  }
});
