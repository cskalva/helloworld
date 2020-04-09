/*
YUI 3.10.3 (build 2fb5187)
Copyright 2013 Yahoo! Inc. All rights reserved.
Licensed under the BSD License.
http://yuilibrary.com/license/
*/

YUI.add("io-upload-iframe",function(e,t){function u(t,n,r){var i=e.Node.create('<iframe src="#" id="io_iframe'+t.id+'" name="io_iframe'+t.id+'" />');i._node.style.position="absolute",i._node.style.top="-1000px",i._node.style.left="-1000px",e.one("body").appendChild(i),e.on("load",function(){r._uploadComplete(t,n)},"#io_iframe"+t.id)}function a(t){e.Event.purgeElement("#io_iframe"+t,!1),e.one("body").removeChild(e.one("#io_iframe"+t))}var n=e.config.win,r=e.config.doc,i=r.documentMode&&r.documentMode>=8,s=decodeURIComponent,o=e.IO.prototype.end;e.mix(e.IO.prototype,{_addData:function(t,n){e.Lang.isObject(n)&&(n=e.QueryString.stringify(n));var i=[],o=n.split("="),u,a;for(u=0,a=o.length-1;u<a;u++)i[u]=r.createElement("input"),i[u].type="hidden",i[u].name=s(o[u].substring(o[u].lastIndexOf("&")+1)),i[u].value=u+1===a?s(o[u+1]):s(o[u+1].substring(0,o[u+1].lastIndexOf("&"))),t.appendChild(i[u]);return i},_removeData:function(e,t){var n,r;for(n=0,r=t.length;n<r;n++)e.removeChild(t[n])},_setAttrs:function(t,n,r){t.setAttribute("action",r),t.setAttribute("method","POST"),t.setAttribute("target","io_iframe"+n),t.setAttribute(e.UA.ie&&!i?"encoding":"enctype","multipart/form-data")},_resetAttrs:function(t,n){e.Object.each(n,function(e,n){e?t.setAttribute(n,e):t.removeAttribute(n)})},_startUploadTimeout:function(e,t){var r=this;r._timeout[e.id]=n.setTimeout(function(){e.status=0,e.statusText="timeout",r.complete(e,t),r.end(e,t)},t.timeout)},_clearUploadTimeout:function(e){var t=this;n.clearTimeout(t._timeout[e]),delete t._timeout[e]},_uploadComplete:function(t,r){var i=this,s=e.one("#io_iframe"+t.id).get("contentWindow.document"),o=s.one("body"),u;r.timeout&&i._clearUploadTimeout(t.id);try{o?(u=o.one("pre:first-child"),t.c.responseText=u?u.get("text"):o.get("text")):t.c.responseXML=s._node}catch(f){t.e="upload failure"}i.complete(t,r),i.end(t,r),n.setTimeout(function(){a(t.id)},0)},_upload:function(t,n,i){var s=this,o=typeof i.form.id=="string"?r.getElementById(i.form.id):i.form.id,u={action:o.getAttribute("action"),target:o.getAttribute("target")},f;return s._setAttrs(o,t.id,n),i.data&&(f=s._addData(o,i.data)),i.timeout&&s._startUploadTimeout(t,i),o.submit(),s.start(t,i),i.data&&s._removeData(o,f),{id:t.id,abort:function(){t.status=0,t.statusText="abort";if(!e.one("#io_iframe"+t.id))return!1;a(t.id),s.complete(t,i),s.end(t,i,u)},isInProgress:function(){return e.one("#io_iframe"+t.id)?!0:!1},io:s}},upload:function(e,t,n){return u(e,n,this),this._upload(e,t,n)},end:function(e,t,n){if(t&&t.form&&t.form.upload){var r=this;r._resetAttrs(f,n)}return o.call(this,e,t)}})},"3.10.3",{requires:["io-base","node-base"]});
