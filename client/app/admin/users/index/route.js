import Ember from 'ember';

export default Ember.Route.extend({
  actions: {
    editUser(user, roles) {
      // console.log('obj:', this.get('model')('roles'))
      console.log('roles?', roles)
      let UserWithRoles = Ember.RSVP.hash({
        id: user.id,
        user: user,
        roles: roles
      })
      this.transitionTo('admin.users.edit', UserWithRoles);
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