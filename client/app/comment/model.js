import Model from 'ember-data/model';
import attr from 'ember-data/attr';
import { belongsTo, hasMany } from 'ember-data/relationships';

export default Model.extend({
  content: attr('string'),
  created: attr('date'),
  user: belongsTo('user'),
  page: belongsTo('page'),
  post: belongsTo('post')
});
