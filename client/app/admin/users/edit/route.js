import Ember from 'ember';

export default Ember.Route.extend({
  isEditingPassword: true,
  actions: {
    editPassword() {
      this.toggleProperty('isEditingPassword')
      console.log('(after toggle) isEditingPassword', this.get('isEditingPassword'))
    },
    cancel() {
      this.sendAction('cancel')
    },    
    saveUser(model) {
      model.save().then(()=> {
        console.log('we saved!')
        this.transitionTo('admin.users');
      })
    },
  }
});
