import Ember from 'ember';

export default Ember.Component.extend({
  roleId: '',
  actions: {
    saveUser(model) {
      // console.log('model', model)
      // console.log('role from form:', this.get('roleId'))
      this.get('store').findRecord('role', this.get('roleId')).then((role)=> {
        model.set('role', role);
        this.sendAction('saveUser', model);
      });
      // this.sendAction('saveUser', model);
    },
    cancel(action) {
      console.log('cancel from admin-user-form')
      this.sendAction('cancel')
    },
    setRole(value) {
      console.log('set role:', value)
      // let model = this.get('model').get('user')
      model.set('role', value)
      // this.set('commentsEnabled', value)
    },
  }
});
