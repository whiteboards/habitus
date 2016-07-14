import Ember from 'ember';

export default Ember.Component.extend({
  session: Ember.inject.service('session'),
  isLoggingIn: null,
  actions: {
    authenticate() {
      let email = this.get('email');
      let password = this.get('password');
      this.set('isLoggingIn', 'login__card--progress')
      this.get('session').authenticate('authenticator:oauth2', email, password).then(() =>{
        console.log('auth completed')
        this.sendAction('transition');
      }).catch((reason) => {
        console.log('reason:', reason.error || reason)
        this.set('errorMessage', reason.error || reason);
        this.set('isLoggingIn', null)
      });
    }
  }
});
