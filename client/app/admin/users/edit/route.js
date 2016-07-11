import Ember from 'ember';

export default Ember.Route.extend({
  isEditingPassword: false,
  actions: {
    editPassword() {
      console.log('(before toggle) isEditingPassword', this.get('isEditingPassword'))
      this.toggleProperty('isEditingPassword')
      console.log('(after toggle) isEditingPassword', this.get('isEditingPassword'))
    },
    saveUser(model) {
      model.save().then(()=> {
        console.log('we saved!')
        this.transitionTo('admin.users');
      })
    }
  },
  canEditPassword: Ember.computed('isEditingPassword', function () {
    console.log('getting computed state..')
    if (this.get('isEditingPassword')) {return 'true'}
    return 'false'
  }), 
});
