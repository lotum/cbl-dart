"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[598],{3905:(e,t,a)=>{a.d(t,{Zo:()=>d,kt:()=>m});var n=a(7294);function r(e,t,a){return t in e?Object.defineProperty(e,t,{value:a,enumerable:!0,configurable:!0,writable:!0}):e[t]=a,e}function i(e,t){var a=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),a.push.apply(a,n)}return a}function s(e){for(var t=1;t<arguments.length;t++){var a=null!=arguments[t]?arguments[t]:{};t%2?i(Object(a),!0).forEach((function(t){r(e,t,a[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(a)):i(Object(a)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(a,t))}))}return e}function o(e,t){if(null==e)return{};var a,n,r=function(e,t){if(null==e)return{};var a,n,r={},i=Object.keys(e);for(n=0;n<i.length;n++)a=i[n],t.indexOf(a)>=0||(r[a]=e[a]);return r}(e,t);if(Object.getOwnPropertySymbols){var i=Object.getOwnPropertySymbols(e);for(n=0;n<i.length;n++)a=i[n],t.indexOf(a)>=0||Object.prototype.propertyIsEnumerable.call(e,a)&&(r[a]=e[a])}return r}var l=n.createContext({}),p=function(e){var t=n.useContext(l),a=t;return e&&(a="function"==typeof e?e(t):s(s({},t),e)),a},d=function(e){var t=p(e.components);return n.createElement(l.Provider,{value:t},e.children)},c={inlineCode:"code",wrapper:function(e){var t=e.children;return n.createElement(n.Fragment,{},t)}},u=n.forwardRef((function(e,t){var a=e.components,r=e.mdxType,i=e.originalType,l=e.parentName,d=o(e,["components","mdxType","originalType","parentName"]),u=p(a),m=r,h=u["".concat(l,".").concat(m)]||u[m]||c[m]||i;return a?n.createElement(h,s(s({ref:t},d),{},{components:a})):n.createElement(h,s({ref:t},d))}));function m(e,t){var a=arguments,r=t&&t.mdxType;if("string"==typeof e||r){var i=a.length,s=new Array(i);s[0]=u;var o={};for(var l in t)hasOwnProperty.call(t,l)&&(o[l]=t[l]);o.originalType=e,o.mdxType="string"==typeof e?e:r,s[1]=o;for(var p=2;p<i;p++)s[p]=a[p];return n.createElement.apply(null,s)}return n.createElement.apply(null,a)}u.displayName="MDXCreateElement"},9354:(e,t,a)=>{a.r(t),a.d(t,{assets:()=>l,contentTitle:()=>s,default:()=>c,frontMatter:()=>i,metadata:()=>o,toc:()=>p});var n=a(7462),r=(a(7294),a(3905));const i={description:"How to Access Strongly Typed Data in a Type Safe Manner"},s="Typed Data",o={unversionedId:"typed-data",id:"typed-data",title:"Typed Data",description:"How to Access Strongly Typed Data in a Type Safe Manner",source:"@site/docs/typed-data.mdx",sourceDirName:".",slug:"/typed-data",permalink:"/typed-data",draft:!1,editUrl:"https://github.com/cbl-dart/cbl-dart/tree/main/docs/docs/typed-data.mdx",tags:[],version:"current",frontMatter:{description:"How to Access Strongly Typed Data in a Type Safe Manner"},sidebar:"sidebar",previous:{title:"Blobs",permalink:"/blobs"},next:{title:"Usage Examples",permalink:"/usage-examples"}},l={},p=[{value:"Getting started",id:"getting-started",level:2}],d={toc:p};function c(e){let{components:t,...a}=e;return(0,r.kt)("wrapper",(0,n.Z)({},d,a,{components:t,mdxType:"MDXLayout"}),(0,r.kt)("h1",{id:"typed-data"},"Typed Data"),(0,r.kt)("metaheader",null),(0,r.kt)("admonition",{type:"caution"},(0,r.kt)("p",{parentName:"admonition"},"The typed data API is ",(0,r.kt)("strong",{parentName:"p"},"experimental")," and might be missing some feature that\nyou need. Please file an ","[issue][issues]"," if you find a bug or have a feature\nrequest.")),(0,r.kt)("p",null,"Couchbase Lite allows dynamic access to data without a fixed data model, not\nrequiring any code generation. This is useful when the data is very dynamic or\ncode generation is undesirable."),(0,r.kt)("p",null,"Often though, the data is known to have a regular structure, and accessing it\nthrough a typed Dart API makes working with it easier and safer."),(0,r.kt)("p",null,"With the help of the ",(0,r.kt)("a",{parentName:"p",href:"https://pub.dev/documentation/cbl_generator/latest/index.html"},(0,r.kt)("inlineCode",{parentName:"a"},"cbl_generator"))," package you can quickly create\nDart classes that can be used to access data in a typed way. Theses classes can\nbe used with specialized APIs of ",(0,r.kt)("a",{parentName:"p",href:"https://pub.dev/documentation/cbl/latest/cbl/Database-class.html"},(0,r.kt)("inlineCode",{parentName:"a"},"Database")),", ",(0,r.kt)("a",{parentName:"p",href:"https://pub.dev/documentation/cbl/latest/cbl/Query-class.html"},(0,r.kt)("inlineCode",{parentName:"a"},"Query"))," and\n",(0,r.kt)("a",{parentName:"p",href:"https://pub.dev/documentation/cbl/latest/cbl/Replicator-class.html"},(0,r.kt)("inlineCode",{parentName:"a"},"Replicator")),"."),(0,r.kt)("h2",{id:"getting-started"},"Getting started"),(0,r.kt)("ol",null,(0,r.kt)("li",{parentName:"ol"},(0,r.kt)("p",{parentName:"li"},"Make sure your ",(0,r.kt)("a",{parentName:"p",href:"/install"},"app is setup")," for using Couchbase Lite.")),(0,r.kt)("li",{parentName:"ol"},(0,r.kt)("p",{parentName:"li"},"Add ",(0,r.kt)("a",{parentName:"p",href:"https://pub.dev/documentation/cbl_generator/latest/index.html"},(0,r.kt)("inlineCode",{parentName:"a"},"cbl_generator"))," and ",(0,r.kt)("a",{parentName:"p",href:"https://pub.dev/documentation/build_runner/latest/index.html"},(0,r.kt)("inlineCode",{parentName:"a"},"build_runner"))," as development\ndependencies:"),(0,r.kt)("pre",{parentName:"li"},(0,r.kt)("code",{parentName:"pre",className:"language-shell"},"flutter pub add --dev cbl_generator build_runner\n"))),(0,r.kt)("li",{parentName:"ol"},(0,r.kt)("p",{parentName:"li"},"Create typed data classes and annotated them with ",(0,r.kt)("a",{parentName:"p",href:"https://pub.dev/documentation/cbl/latest/cbl/TypedDocument-class.html"},(0,r.kt)("inlineCode",{parentName:"a"},"TypedDocument"))," and\n",(0,r.kt)("a",{parentName:"p",href:"https://pub.dev/documentation/cbl/latest/cbl/TypedDictionary-class.html"},(0,r.kt)("inlineCode",{parentName:"a"},"TypedDictionary")),":"),(0,r.kt)("pre",{parentName:"li"},(0,r.kt)("code",{parentName:"pre",className:"language-dart"},"// user.dart\n\nimport 'package:cbl/cbl.dart';\n\n// Declare the part file into which the generated code will be written.\npart 'user.cbl.type.g.dart';\n\n// Per default the type of a document is encoded in the `type` property in\n// the underlying data. The value is a string that is the name of the annotated\n// class. This can be customized by setting `TypedDocument.typeMatcher`.\n@TypedDocument()\nabstract class User with _$User {\n  factory User({\n    @DocumentId() String? id,\n    required PersonalName name,\n    String? email,\n    required String username,\n    required DateTime createdAt,\n  }) = MutableUser;\n}\n\n@TypedDictionary()\nabstract class PersonalName with _$PersonalName {\n  factory PersonalName({\n    required String first,\n    required String last,\n  }) = MutablePersonalName;\n}\n"))),(0,r.kt)("li",{parentName:"ol"},(0,r.kt)("p",{parentName:"li"},"Create a typed database by annotating a class with ",(0,r.kt)("a",{parentName:"p",href:"https://pub.dev/documentation/cbl/latest/cbl/TypedDatabase-class.html"},(0,r.kt)("inlineCode",{parentName:"a"},"TypedDatabase")),":"),(0,r.kt)("pre",{parentName:"li"},(0,r.kt)("code",{parentName:"pre",className:"language-dart"},"// app_database.dart\n\nimport 'package:cbl/cbl.dart';\n\nimport 'user.dart';\n\n@TypedDatabase(\n  // List all the typed data classes that will be used in the database.\n  types: {\n    User,\n    PersonalName,\n  },\n)\nabstract class $AppDatabase {}\n"))),(0,r.kt)("li",{parentName:"ol"},(0,r.kt)("p",{parentName:"li"},"Run the build runner to invoke the generator:"),(0,r.kt)("pre",{parentName:"li"},(0,r.kt)("code",{parentName:"pre",className:"language-shell"},"dart run build_runner build\n# or\nflutter run build_runner build\n"))),(0,r.kt)("li",{parentName:"ol"},(0,r.kt)("p",{parentName:"li"},"Open an instance of the typed database and use it:"),(0,r.kt)("pre",{parentName:"li"},(0,r.kt)("code",{parentName:"pre",className:"language-dart"},"import 'app_database.cbl.database.g.dart';\nimport 'user.dart';\n\nFuture<void> useTypedDatabase() {\n  // Use a static method on the generated typed database class to open an instance.\n  final db = await AppDatabase.openAsync('app');\n\n  // Every typed data class has a mutable and immutable variant. The mutable\n  // class has the same name as the immutable class, but with the `Mutable`\n  // suffix. A mutable instance can be created by constructing it, or from\n  // an immutable instance, through the `toMutable` method.\n  final user = MutableUser(\n    name: PersonalName(first: 'Alice', last: 'Green'),\n    email: 'alice@green.com',\n    username: 'ali',\n    createdAt: DateTime.now(),\n  );\n\n  // The API to save typed documents is slightly different than the API to\n  // save plain documents. `saveTypedDocument` returns an object that has methods\n  // for saving the document with conflict resolution through concurrency control or\n  // a custom conflict handler.\n  await db.saveTypedDocument(user).withConcurrencyControl();\n\n  // To retrieve a typed document, use the `typedDocument` method and pass it the\n  // type of the requested document through the type parameter.\n  final savedUser = await db.typedDocument<User>(user.id);\n}\n")))))}c.isMDXComponent=!0}}]);