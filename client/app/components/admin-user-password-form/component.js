import Ember from 'ember';

export default Ember.Component.extend({
  actions: {
    saveUser(model) {
      console.log('save the user!', model)
      this.sendAction('saveUser', model);
    },
    cancel() {
      this.sendAction('cancel')
    }
  }
});
