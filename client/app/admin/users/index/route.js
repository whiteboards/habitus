import Ember from 'ember';

export default Ember.Route.extend({
  actions: {
    editUser(user) {
      this.transitionTo('admin.users.edit', user);
    },
    deleteUser(user) {
      user.deleteRecord();
      console.log('isdeleted?', user.get('isDeleted'))
      user.save().then(()=> {
        console.log('we deleted!')
      })
    }
  }
});