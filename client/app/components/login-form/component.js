import Ember from 'ember';

export default Ember.Component.extend({
  session: Ember.inject.service('session'),
  actions: {
    authenticate() {
      let displayName = this.get('displayName');
      let password = this.get('password');
      this.get('session').authenticate('authenticator:oauth2', displayName, password).catch((reason) => {
        this.set('errorMessage', reason.error || reason);
      });
    }
  }
});
