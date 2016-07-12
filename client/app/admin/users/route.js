import Ember from 'ember';

export default Ember.Route.extend({
  model() {
    return Ember.RSVP.hash({
      users: this.store.findAll('user', {include: 'roleId'}),
      roles: this.store.findAll('role')
    });
  }
});
