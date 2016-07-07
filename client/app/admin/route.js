import Ember from 'ember';
import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';
export default Ember.Route.extend(AuthenticatedRouteMixin, {
  model() {
    return this.store.findAll('user');
  },
  actions: {
    error(error, transition) {
      if (error) {
        return this.transitionTo('admin.error');
      }
    }
  }
});
