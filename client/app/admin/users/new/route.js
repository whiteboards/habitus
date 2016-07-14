import Ember from 'ember';

export default Ember.Route.extend({
  model() {
    return Ember.RSVP.hash({
      user: this.store.createRecord('user'),
      roles: this.store.findAll('role')
    });
  },
  actions: {
    cancel() {
      console.log('cancel triggered')
      this.transitionTo('admin.users.index');
    },
    saveUser(model) {
      model.save().then(()=> {
        console.log('we saved!')
        this.transitionTo('admin.users');
      })
    }
  }
});
