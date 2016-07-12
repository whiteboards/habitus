import Ember from 'ember';

export default Ember.Component.extend({
  actions: {
    editPassword() {
      this.toggleProperty('isEditingPassword')
      console.log('(after toggle) isEditingPassword', this.get('isEditingPassword'))
    },
    saveUser(model) {
      console.log('save the user!', model)
      this.sendAction('saveUser', model);
    },
    cancel() {
      console.log('cancel from admin-user')
      this.sendAction('cancel')
    }
  }
});
