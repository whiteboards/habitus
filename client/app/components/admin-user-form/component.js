import Ember from 'ember';

export default Ember.Component.extend({
  actions: {
    saveUser(model) {
      console.log('role from form', this.get('roleId'))
      this.get('store').findRecord('role', this.get('roleId')).then((role)=> {
        
        model.set('role', role);
        this.sendAction('saveUser', model);
      });
    },
    cancel() {
      console.log('cancel from admin-user-form')
      this.sendAction('cancel')
    }
  }
});
