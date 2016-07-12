import Ember from 'ember';

export default Ember.Component.extend({
  actions: {
    saveUser(model) {
      console.log('save the user!', model)
      this.sendAction('saveUser', model);
    },
    cancel() {
      console.log('cancel from admin-user-form')
      this.sendAction('cancel')
    }
  }
});
