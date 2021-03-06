function Jsboot(app, $) {
  var jsb;

  app.jsboot = app.jsboot || { callbacks: {} };
  jsb = app.jsboot;

  // callback functions expect one parameter, a
  // data object that is stored in the inline
  // application/json script tags
  jsb.on = function(key, fun) {
    key = key.replace('#', '-');
    jsb.callbacks['jsboot-' + key] = fun;
  };

  jsb.runBootstrapping = function(el) {
    var $el = $(el),
        id = $el.attr('id'),
        fun = jsb.callbacks[id],
        jsonText, data;

    if (typeof(fun) === 'function') {
      jsonText = $el.html();

      if (jsonText === "") {
        data = {};
      } else {
        data = JSON.parse(jsonText);
      }

      fun(data);
    }
  };

  jsb.runAllBootstrapping = function() {
    $('script.jsboot-data').each(function(idx, el){
      jsb.runBootstrapping(el);
    });
  };

  $(function(){
    jsb.runAllBootstrapping();
  });
}
