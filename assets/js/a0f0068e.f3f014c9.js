"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[346],{3905:(e,t,a)=>{a.d(t,{Zo:()=>u,kt:()=>m});var n=a(7294);function l(e,t,a){return t in e?Object.defineProperty(e,t,{value:a,enumerable:!0,configurable:!0,writable:!0}):e[t]=a,e}function r(e,t){var a=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),a.push.apply(a,n)}return a}function o(e){for(var t=1;t<arguments.length;t++){var a=null!=arguments[t]?arguments[t]:{};t%2?r(Object(a),!0).forEach((function(t){l(e,t,a[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(a)):r(Object(a)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(a,t))}))}return e}function i(e,t){if(null==e)return{};var a,n,l=function(e,t){if(null==e)return{};var a,n,l={},r=Object.keys(e);for(n=0;n<r.length;n++)a=r[n],t.indexOf(a)>=0||(l[a]=e[a]);return l}(e,t);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);for(n=0;n<r.length;n++)a=r[n],t.indexOf(a)>=0||Object.prototype.propertyIsEnumerable.call(e,a)&&(l[a]=e[a])}return l}var s=n.createContext({}),c=function(e){var t=n.useContext(s),a=t;return e&&(a="function"==typeof e?e(t):o(o({},t),e)),a},u=function(e){var t=c(e.components);return n.createElement(s.Provider,{value:t},e.children)},p={inlineCode:"code",wrapper:function(e){var t=e.children;return n.createElement(n.Fragment,{},t)}},d=n.forwardRef((function(e,t){var a=e.components,l=e.mdxType,r=e.originalType,s=e.parentName,u=i(e,["components","mdxType","originalType","parentName"]),d=c(a),m=l,h=d["".concat(s,".").concat(m)]||d[m]||p[m]||r;return a?n.createElement(h,o(o({ref:t},u),{},{components:a})):n.createElement(h,o({ref:t},u))}));function m(e,t){var a=arguments,l=t&&t.mdxType;if("string"==typeof e||l){var r=a.length,o=new Array(r);o[0]=d;var i={};for(var s in t)hasOwnProperty.call(t,s)&&(i[s]=t[s]);i.originalType=e,i.mdxType="string"==typeof e?e:l,o[1]=i;for(var c=2;c<r;c++)o[c]=a[c];return n.createElement.apply(null,o)}return n.createElement.apply(null,a)}d.displayName="MDXCreateElement"},3818:(e,t,a)=>{a.r(t),a.d(t,{assets:()=>s,contentTitle:()=>o,default:()=>p,frontMatter:()=>r,metadata:()=>i,toc:()=>c});var n=a(7462),l=(a(7294),a(3905));const r={description:"Usage Examples Demonstrating How to Use Various Features of Couchbase Lite for Dart"},o="Usage Examples",i={unversionedId:"usage-examples",id:"usage-examples",title:"Usage Examples",description:"Usage Examples Demonstrating How to Use Various Features of Couchbase Lite for Dart",source:"@site/docs/usage-examples.mdx",sourceDirName:".",slug:"/usage-examples",permalink:"/usage-examples",draft:!1,editUrl:"https://github.com/cbl-dart/cbl-dart/tree/main/docs/docs/usage-examples.mdx",tags:[],version:"current",frontMatter:{description:"Usage Examples Demonstrating How to Use Various Features of Couchbase Lite for Dart"},sidebar:"sidebar",previous:{title:"Typed Data",permalink:"/typed-data"},next:{title:"Instrumentation",permalink:"/instrumentation"}},s={},c=[{value:"Open a database",id:"open-a-database",level:2},{value:"Create a document",id:"create-a-document",level:2},{value:"Read a document",id:"read-a-document",level:2},{value:"Update a document",id:"update-a-document",level:2},{value:"Delete a document",id:"delete-a-document",level:2},{value:"Build a <code>Query</code> with the <code>QueryBuilder</code> API",id:"build-a-query-with-the-querybuilder-api",level:2},{value:"Build a <code>Query</code> with SQL++",id:"build-a-query-with-sql",level:2},{value:"Data sync with <code>Replicator</code> to Sync Gateway",id:"data-sync-with-replicator-to-sync-gateway",level:2}],u={toc:c};function p(e){let{components:t,...a}=e;return(0,l.kt)("wrapper",(0,n.Z)({},u,a,{components:t,mdxType:"MDXLayout"}),(0,l.kt)("h1",{id:"usage-examples"},"Usage Examples"),(0,l.kt)("metaheader",null),(0,l.kt)("h2",{id:"open-a-database"},"Open a database"),(0,l.kt)("p",null,"Every ",(0,l.kt)("a",{parentName:"p",href:"https://pub.dev/documentation/cbl/latest/cbl/Database-class.html"},(0,l.kt)("inlineCode",{parentName:"a"},"Database"))," has a name which is used to determine its filename. The\nfull filename is the concatenation of the database name and the extension\n",(0,l.kt)("inlineCode",{parentName:"p"},".cblite2"),"."),(0,l.kt)("p",null,"When opening a database without specifying a directory it will be put into a\ndefault location that is platform dependent:"),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-dart"},"final db = await Database.openAsync('my-database');\n")),(0,l.kt)("p",null,"If you want to open a database in a specific directory you can specify the\ndirectory like this:"),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-dart"},"final db = await Database.openAsync(\n  'my-database',\n  DatabaseConfiguration(directory: 'my-directory')\n);\n")),(0,l.kt)("p",null,"If a database with the same name already exists in the directory, it will be\nopened. Otherwise a new database will be created."),(0,l.kt)("p",null,"When you are done with the database, you should close it by calling\n",(0,l.kt)("a",{parentName:"p",href:"https://pub.dev/documentation/cbl/latest/cbl/Database/close.html"},(0,l.kt)("inlineCode",{parentName:"a"},"Database.close")),". This will free up any resources used by the database, as\nwell as remove change listeners, close change streams and close associated\nreplicators."),(0,l.kt)("h2",{id:"create-a-document"},"Create a document"),(0,l.kt)("p",null,"The default constructor of ",(0,l.kt)("a",{parentName:"p",href:"https://pub.dev/documentation/cbl/latest/cbl/MutableDocument-class.html"},(0,l.kt)("inlineCode",{parentName:"a"},"MutableDocument"))," creates a document with a\nrandomly generated id and optionally initializes it with some properties:"),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-dart"},"final doc = MutableDocument({\n  'name': 'Alice',\n  'age': 29,\n});\n\nawait db.saveDocument(doc);\n")),(0,l.kt)("p",null,"It's also possible to create a document with a specific id:"),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-dart"},"final doc = MutableDocument.withId('ali', {\n  'name': 'Alice',\n  'age': 29,\n});\n\nawait db.saveDocument(doc);\n")),(0,l.kt)("h2",{id:"read-a-document"},"Read a document"),(0,l.kt)("p",null,"To read a ",(0,l.kt)("a",{parentName:"p",href:"https://pub.dev/documentation/cbl/latest/cbl/Document-class.html"},(0,l.kt)("inlineCode",{parentName:"a"},"Document"))," pass the document's id to ",(0,l.kt)("a",{parentName:"p",href:"https://pub.dev/documentation/cbl/latest/cbl/Database/document.html"},(0,l.kt)("inlineCode",{parentName:"a"},"Database.document")),":"),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-dart"},"final doc = await db.document('ali');\n\n// If the document exists, an immutable `Document` is returned.\nif (doc != null) {\n  print('Name: ${doc.string('name')}');\n  print('Age: ${doc.string('age')}');\n}\n")),(0,l.kt)("h2",{id:"update-a-document"},"Update a document"),(0,l.kt)("p",null,"To update a document, first read it, turn it into a ",(0,l.kt)("a",{parentName:"p",href:"https://pub.dev/documentation/cbl/latest/cbl/MutableDocument-class.html"},(0,l.kt)("inlineCode",{parentName:"a"},"MutableDocument"))," and\nupdate its properties. Then save it again with ",(0,l.kt)("a",{parentName:"p",href:"https://pub.dev/documentation/cbl/latest/cbl/Database/saveDocument.html"},(0,l.kt)("inlineCode",{parentName:"a"},"Database.saveDocument")),":"),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-dart"},"final doc = await db.document('ali');\n\nfinal mutableDoc = doc!.toMutable();\n\n// You can use one of the typed setters to update the document's properties.\nmutableDoc.setArray(MutableArray(['Dart']), key: 'languages');\n\n// Or alternatively, use this subscript syntax to get a [MutableFragment] and\n// use it to update the document.\nmutableDoc['languages'].array = MutableArray(['Dart']);\n\n// The untyped `setValue` setter does the conversion from a plain Dart collection\n// to a document collection (`MutableArray` or `MutableDictionary`) for you.\nmutableDoc.setValue(['Dart'], key: 'languages');\n\n// Again, there is an alternative subscript syntax available.\nmutableDoc['languages'].value = ['Dart'];\n\n\nawait db.saveDocument(mutableDoc);\n")),(0,l.kt)("p",null,"Check out the documentation for ",(0,l.kt)("a",{parentName:"p",href:"https://pub.dev/documentation/cbl/latest/cbl/Database/saveDocument.html"},(0,l.kt)("inlineCode",{parentName:"a"},"Database.saveDocument"))," to learn about how\nconflicts are handled."),(0,l.kt)("h2",{id:"delete-a-document"},"Delete a document"),(0,l.kt)("p",null,"To delete a document, you need to read it first and than pass it to\n",(0,l.kt)("a",{parentName:"p",href:"https://pub.dev/documentation/cbl/latest/cbl/Database/deleteDocument.html"},(0,l.kt)("inlineCode",{parentName:"a"},"Database.deleteDocument")),":"),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-dart"},"final doc = await db.document('ali');\n\nawait db.deleteDocument(doc);\n")),(0,l.kt)("p",null,"Check out the documentation for ",(0,l.kt)("a",{parentName:"p",href:"https://pub.dev/documentation/cbl/latest/cbl/Database/deleteDocument.html"},(0,l.kt)("inlineCode",{parentName:"a"},"Database.deleteDocument"))," to learn about how\nconflicts are handled."),(0,l.kt)("h2",{id:"build-a-query-with-the-querybuilder-api"},"Build a ",(0,l.kt)("inlineCode",{parentName:"h2"},"Query")," with the ",(0,l.kt)("inlineCode",{parentName:"h2"},"QueryBuilder")," API"),(0,l.kt)("p",null,"A ",(0,l.kt)("a",{parentName:"p",href:"https://pub.dev/documentation/cbl/latest/cbl/Query-class.html"},(0,l.kt)("inlineCode",{parentName:"a"},"Query"))," can be built in a type safe way through the ",(0,l.kt)("a",{parentName:"p",href:"https://pub.dev/documentation/cbl/latest/cbl/QueryBuilder-class.html"},(0,l.kt)("inlineCode",{parentName:"a"},"QueryBuilder")),"\nAPI."),(0,l.kt)("p",null,"The query below returns the average age of people with the same name:"),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-dart"},"final query = const QueryBuilder()\n  .select(\n    SelectResult.property('name'),\n    SelectResult.expression(\n      Function_.avg(Expression.property('age'))\n    ).as('avgAge'),\n  )\n  .from(DataSource.database(db))\n  .groupBy(Expression.property('name'));\n\nfinal resultSet = await query.execute();\nfinal results = await resultSet\n  .asStream()\n  // Converts each result into a `Map`, consisting only of plain Dart values.\n  .map((result) => result.toPlainMap())\n  .toList();\n\nprint(results);\n")),(0,l.kt)("p",null,"Given these documents:"),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-dart"},"[\n  {'name': 'Alice', 'age': 29},\n  {'name': 'Bob', 'age': 45},\n  {'name': 'Alice', 'age': 16},\n]\n")),(0,l.kt)("p",null,(0,l.kt)("inlineCode",{parentName:"p"},"results")," will be:"),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-dart"},"[\n  {'name': 'Alice', 'avgAge': 22.5},\n  {'name': 'Bob', 'avgAge': 45},\n]\n")),(0,l.kt)("h2",{id:"build-a-query-with-sql"},"Build a ",(0,l.kt)("inlineCode",{parentName:"h2"},"Query")," with SQL++"),(0,l.kt)("p",null,(0,l.kt)("a",{parentName:"p",href:"https://www.couchbase.com/products/n1ql"},"SQL++")," is an extension of SQL for querying JSON style data."),(0,l.kt)("p",null,"The query below is equivalent to query from the ",(0,l.kt)("a",{parentName:"p",href:"https://pub.dev/documentation/cbl/latest/cbl/QueryBuilder-class.html"},(0,l.kt)("inlineCode",{parentName:"a"},"QueryBuilder"))," example\nabove:"),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-dart"},"final query = await Query.fromN1ql(\n  db,\n  '''\n  SELECT name, avg(age) AS avgAge\n  FROM _\n  GROUP BY name\n  ''',\n);\n")),(0,l.kt)("h2",{id:"data-sync-with-replicator-to-sync-gateway"},"Data sync with ",(0,l.kt)("inlineCode",{parentName:"h2"},"Replicator")," to Sync Gateway"),(0,l.kt)("p",null,"This example synchronizes the database with a remote Sync Gateway instance,\nwithout authentication. This only works when Sync Gateway has been configured\nwith the ",(0,l.kt)("inlineCode",{parentName:"p"},"GUEST")," user."),(0,l.kt)("p",null,"A ",(0,l.kt)("a",{parentName:"p",href:"https://pub.dev/documentation/cbl/latest/cbl/ReplicatorConfiguration-class.html"},(0,l.kt)("inlineCode",{parentName:"a"},"ReplicatorConfiguration"))," with only default values creates a\n",(0,l.kt)("a",{parentName:"p",href:"https://pub.dev/documentation/cbl/latest/cbl/Replicator-class.html"},(0,l.kt)("inlineCode",{parentName:"a"},"Replicator"))," with ",(0,l.kt)("inlineCode",{parentName:"p"},"type")," ",(0,l.kt)("a",{parentName:"p",href:"https://pub.dev/documentation/cbl/latest/cbl/ReplicatorType.html"},(0,l.kt)("inlineCode",{parentName:"a"},"ReplicatorType.pushAndPull"))," that is\nnot ",(0,l.kt)("inlineCode",{parentName:"p"},"continuous"),"."),(0,l.kt)("p",null,"After starting this replicator, it will push changes from the local database to\nthe remote database and pull changes from the remote database to the local\ndatabase and then stop again."),(0,l.kt)("p",null,"Both ",(0,l.kt)("a",{parentName:"p",href:"https://pub.dev/documentation/cbl/latest/cbl/Replicator/start.html"},(0,l.kt)("inlineCode",{parentName:"a"},"Replicator.start"))," and ",(0,l.kt)("a",{parentName:"p",href:"https://pub.dev/documentation/cbl/latest/cbl/Replicator/stop.html"},(0,l.kt)("inlineCode",{parentName:"a"},"Replicator.stop"))," don't immediately\nstart/stop the replicator. The current status of the replicator is available in\n",(0,l.kt)("a",{parentName:"p",href:"https://pub.dev/documentation/cbl/latest/cbl/ReplicatorStatus/activity.html"},(0,l.kt)("inlineCode",{parentName:"a"},"ReplicatorStatus.activity")),"."),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-dart"},"final replicator = await Replicator.create(ReplicatorConfiguration(\n  database: db,\n  target: UrlEndpoint('http://localhost:4984/my-database'),\n));\n\nawait replicator.addChangeListener((change) {\n    print('Replicator activity: ${change.status.activity}');\n});\n\nawait replicator.start();\n")),(0,l.kt)("p",null,"When you are done with the replicator, you should close it by calling ",(0,l.kt)("inlineCode",{parentName:"p"},"close"),".\nThis will free up any resources used by the replicator, as well as remove change\nlisteners and close change streams."))}p.isMDXComponent=!0}}]);