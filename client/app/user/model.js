import Model from 'ember-data/model';
import attr from 'ember-data/attr';
import { belongsTo } from 'ember-data/relationships';

export default Model.extend({
  firstName: attr('string'),
  lastName: attr('string'),
  email: attr('string'),
  role: belongsTo('role', { async: true}),
  displayName: attr('string'),
  password: attr('string'),  
  passwordConfirmation: attr('string')
});
