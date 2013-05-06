/*
 Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 For licensing, see LICENSE.html or http://ckeditor.com/license
*/
CKEDITOR.dialog.add("select",function(e){function t(e,t,a,n,i){return e=d(e),n=n?n.createElement("OPTION"):document.createElement("OPTION"),e&&n&&"option"==n.getName()?(CKEDITOR.env.ie?(isNaN(parseInt(i,10))?e.$.options.add(n.$):e.$.options.add(n.$,i),n.$.innerHTML=t.length>0?t:"",n.$.value=a):(null!==i&&e.getChildCount()>i?e.getChild(0>i?0:i).insertBeforeMe(n):e.append(n),n.setText(t.length>0?t:""),n.setValue(a)),n):!1}function a(e){for(var e=d(e),t=r(e),a=e.getChildren().count()-1;a>=0;a--)e.getChild(a).$.selected&&e.getChild(a).remove();l(e,t)}function n(e,t,a,n){return e=d(e),0>t?!1:(e=e.getChild(t),e.setText(a),e.setValue(n),e)}function i(e){for(e=d(e);e.getChild(0)&&e.getChild(0).remove(););}function o(e,a,n){var e=d(e),i=r(e);if(0>i)return!1;if(a=i+a,a=0>a?0:a,a=a>=e.getChildCount()?e.getChildCount()-1:a,i==a)return!1;var i=e.getChild(i),o=i.getText(),s=i.getValue();return i.remove(),i=t(e,o,s,n?n:null,a),l(e,a),i}function r(e){return(e=d(e))?e.$.selectedIndex:-1}function l(e,t){if(e=d(e),0>t)return null;var a=e.getChildren().count();return e.$.selectedIndex=t>=a?a-1:t,e}function s(e){return(e=d(e))?e.getChildren():!1}function d(e){return e&&e.domId&&e.getInputElement().$?e.getInputElement():e&&e.$?e:!1}return{title:e.lang.forms.select.title,minWidth:CKEDITOR.env.ie?460:395,minHeight:CKEDITOR.env.ie?320:300,onShow:function(){delete this.selectBox,this.setupContent("clear");var e=this.getParentEditor().getSelection().getSelectedElement();if(e&&"select"==e.getName()){this.selectBox=e,this.setupContent(e.getName(),e);for(var e=s(e),t=0;e.count()>t;t++)this.setupContent("option",e.getItem(t))}},onOk:function(){var e=this.getParentEditor(),t=this.selectBox,a=!t;if(a&&(t=e.document.createElement("select")),this.commitContent(t),a&&(e.insertElement(t),CKEDITOR.env.ie)){var n=e.getSelection(),i=n.createBookmarks();setTimeout(function(){n.selectBookmarks(i)},0)}},contents:[{id:"info",label:e.lang.forms.select.selectInfo,title:e.lang.forms.select.selectInfo,accessKey:"",elements:[{id:"txtName",type:"text",widths:["25%","75%"],labelLayout:"horizontal",label:e.lang.common.name,"default":"",accessKey:"N",style:"width:350px",setup:function(e,t){"clear"==e?this.setValue(this["default"]||""):"select"==e&&this.setValue(t.data("cke-saved-name")||t.getAttribute("name")||"")},commit:function(e){this.getValue()?e.data("cke-saved-name",this.getValue()):(e.data("cke-saved-name",!1),e.removeAttribute("name"))}},{id:"txtValue",type:"text",widths:["25%","75%"],labelLayout:"horizontal",label:e.lang.forms.select.value,style:"width:350px","default":"",className:"cke_disabled",onLoad:function(){this.getInputElement().setAttribute("readOnly",!0)},setup:function(e,t){"clear"==e?this.setValue(""):"option"==e&&t.getAttribute("selected")&&this.setValue(t.$.value)}},{type:"hbox",widths:["175px","170px"],children:[{id:"txtSize",type:"text",labelLayout:"horizontal",label:e.lang.forms.select.size,"default":"",accessKey:"S",style:"width:175px",validate:function(){var t=CKEDITOR.dialog.validate.integer(e.lang.common.validateNumberFailed);return""===this.getValue()||t.apply(this)},setup:function(e,t){"select"==e&&this.setValue(t.getAttribute("size")||""),CKEDITOR.env.webkit&&this.getInputElement().setStyle("width","86px")},commit:function(e){this.getValue()?e.setAttribute("size",this.getValue()):e.removeAttribute("size")}},{type:"html",html:"<span>"+CKEDITOR.tools.htmlEncode(e.lang.forms.select.lines)+"</span>"}]},{type:"html",html:"<span>"+CKEDITOR.tools.htmlEncode(e.lang.forms.select.opAvail)+"</span>"},{type:"hbox",widths:["115px","115px","100px"],children:[{type:"vbox",children:[{id:"txtOptName",type:"text",label:e.lang.forms.select.opText,style:"width:115px",setup:function(e){"clear"==e&&this.setValue("")}},{type:"select",id:"cmbName",label:"",title:"",size:5,style:"width:115px;height:75px",items:[],onChange:function(){var e=this.getDialog(),t=e.getContentElement("info","cmbValue"),a=e.getContentElement("info","txtOptName"),e=e.getContentElement("info","txtOptValue"),n=r(this);l(t,n),a.setValue(this.getValue()),e.setValue(t.getValue())},setup:function(e,a){"clear"==e?i(this):"option"==e&&t(this,a.getText(),a.getText(),this.getDialog().getParentEditor().document)},commit:function(e){var a=this.getDialog(),n=s(this),o=s(a.getContentElement("info","cmbValue")),r=a.getContentElement("info","txtValue").getValue();i(e);for(var l=0;n.count()>l;l++){var d=t(e,n.getItem(l).getValue(),o.getItem(l).getValue(),a.getParentEditor().document);o.getItem(l).getValue()==r&&(d.setAttribute("selected","selected"),d.selected=!0)}}}]},{type:"vbox",children:[{id:"txtOptValue",type:"text",label:e.lang.forms.select.opValue,style:"width:115px",setup:function(e){"clear"==e&&this.setValue("")}},{type:"select",id:"cmbValue",label:"",size:5,style:"width:115px;height:75px",items:[],onChange:function(){var e=this.getDialog(),t=e.getContentElement("info","cmbName"),a=e.getContentElement("info","txtOptName"),e=e.getContentElement("info","txtOptValue"),n=r(this);l(t,n),a.setValue(t.getValue()),e.setValue(this.getValue())},setup:function(e,a){if("clear"==e)i(this);else if("option"==e){var n=a.getValue();t(this,n,n,this.getDialog().getParentEditor().document),"selected"==a.getAttribute("selected")&&this.getDialog().getContentElement("info","txtValue").setValue(n)}}}]},{type:"vbox",padding:5,children:[{type:"button",id:"btnAdd",style:"",label:e.lang.forms.select.btnAdd,title:e.lang.forms.select.btnAdd,style:"width:100%;",onClick:function(){var e=this.getDialog();e.getParentEditor();var a=e.getContentElement("info","txtOptName"),n=e.getContentElement("info","txtOptValue"),i=e.getContentElement("info","cmbName"),o=e.getContentElement("info","cmbValue");t(i,a.getValue(),a.getValue(),e.getParentEditor().document),t(o,n.getValue(),n.getValue(),e.getParentEditor().document),a.setValue(""),n.setValue("")}},{type:"button",id:"btnModify",label:e.lang.forms.select.btnModify,title:e.lang.forms.select.btnModify,style:"width:100%;",onClick:function(){var e=this.getDialog(),t=e.getContentElement("info","txtOptName"),a=e.getContentElement("info","txtOptValue"),i=e.getContentElement("info","cmbName"),e=e.getContentElement("info","cmbValue"),o=r(i);o>=0&&(n(i,o,t.getValue(),t.getValue()),n(e,o,a.getValue(),a.getValue()))}},{type:"button",id:"btnUp",style:"width:100%;",label:e.lang.forms.select.btnUp,title:e.lang.forms.select.btnUp,onClick:function(){var e=this.getDialog(),t=e.getContentElement("info","cmbName"),a=e.getContentElement("info","cmbValue");o(t,-1,e.getParentEditor().document),o(a,-1,e.getParentEditor().document)}},{type:"button",id:"btnDown",style:"width:100%;",label:e.lang.forms.select.btnDown,title:e.lang.forms.select.btnDown,onClick:function(){var e=this.getDialog(),t=e.getContentElement("info","cmbName"),a=e.getContentElement("info","cmbValue");o(t,1,e.getParentEditor().document),o(a,1,e.getParentEditor().document)}}]}]},{type:"hbox",widths:["40%","20%","40%"],children:[{type:"button",id:"btnSetValue",label:e.lang.forms.select.btnSetValue,title:e.lang.forms.select.btnSetValue,onClick:function(){var e=this.getDialog(),t=e.getContentElement("info","cmbValue");e.getContentElement("info","txtValue").setValue(t.getValue())}},{type:"button",id:"btnDelete",label:e.lang.forms.select.btnDelete,title:e.lang.forms.select.btnDelete,onClick:function(){var e=this.getDialog(),t=e.getContentElement("info","cmbName"),n=e.getContentElement("info","cmbValue"),i=e.getContentElement("info","txtOptName"),e=e.getContentElement("info","txtOptValue");a(t),a(n),i.setValue(""),e.setValue("")}},{id:"chkMulti",type:"checkbox",label:e.lang.forms.select.chkMulti,"default":"",accessKey:"M",value:"checked",setup:function(e,t){"select"==e&&this.setValue(t.getAttribute("multiple")),CKEDITOR.env.webkit&&this.getElement().getParent().setStyle("vertical-align","middle")},commit:function(e){this.getValue()?e.setAttribute("multiple",this.getValue()):e.removeAttribute("multiple")}}]}]}]}});