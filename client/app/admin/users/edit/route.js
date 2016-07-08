import Ember from 'ember';

export default Ember.Route.extend({
  actions: {
    editPassword() {
      console.log('isEditingPassword', this.get('isEditingPassword'))
      this.toggleProperty('isEditingPassword')
      console.log('isEditingPassword', this.get('isEditingPassword'))
    },
    saveUser(model) {
      model.save().then(()=> {
        console.log('we saved!')
        this.transitionTo('admin.users');
      })
    }
  }
});
