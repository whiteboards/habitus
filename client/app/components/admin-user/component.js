import Ember from 'ember';

export default Ember.Component.extend({
  isInProgress: false,
  actions: {
    editPassword() {
      this.toggleProperty('isEditingPassword')
      console.log('(after toggle) isEditingPassword', this.get('isEditingPassword'))
    },
    saveUser(model) {
      this.set('isInProgress', true)
      console.log('save the user!', model)
      this.sendAction('saveUser', model);
    },
    cancel() {
      console.log('cancel from admin-user')
      this.sendAction('cancel', true)
    },
    error(error, transition) {
      if (error) {
        this.set('isInProgress', false)
      }
      console.log('maybe we got an error?')
    }
  }
});
