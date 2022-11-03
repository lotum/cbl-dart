"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[831],{3905:(e,a,t)=>{t.d(a,{Zo:()=>p,kt:()=>b});var n=t(7294);function o(e,a,t){return a in e?Object.defineProperty(e,a,{value:t,enumerable:!0,configurable:!0,writable:!0}):e[a]=t,e}function r(e,a){var t=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);a&&(n=n.filter((function(a){return Object.getOwnPropertyDescriptor(e,a).enumerable}))),t.push.apply(t,n)}return t}function i(e){for(var a=1;a<arguments.length;a++){var t=null!=arguments[a]?arguments[a]:{};a%2?r(Object(t),!0).forEach((function(a){o(e,a,t[a])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(t)):r(Object(t)).forEach((function(a){Object.defineProperty(e,a,Object.getOwnPropertyDescriptor(t,a))}))}return e}function s(e,a){if(null==e)return{};var t,n,o=function(e,a){if(null==e)return{};var t,n,o={},r=Object.keys(e);for(n=0;n<r.length;n++)t=r[n],a.indexOf(t)>=0||(o[t]=e[t]);return o}(e,a);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);for(n=0;n<r.length;n++)t=r[n],a.indexOf(t)>=0||Object.prototype.propertyIsEnumerable.call(e,t)&&(o[t]=e[t])}return o}var l=n.createContext({}),c=function(e){var a=n.useContext(l),t=a;return e&&(t="function"==typeof e?e(a):i(i({},a),e)),t},p=function(e){var a=c(e.components);return n.createElement(l.Provider,{value:a},e.children)},d={inlineCode:"code",wrapper:function(e){var a=e.children;return n.createElement(n.Fragment,{},a)}},u=n.forwardRef((function(e,a){var t=e.components,o=e.mdxType,r=e.originalType,l=e.parentName,p=s(e,["components","mdxType","originalType","parentName"]),u=c(t),b=o,m=u["".concat(l,".").concat(b)]||u[b]||d[b]||r;return t?n.createElement(m,i(i({ref:a},p),{},{components:t})):n.createElement(m,i({ref:a},p))}));function b(e,a){var t=arguments,o=a&&a.mdxType;if("string"==typeof e||o){var r=t.length,i=new Array(r);i[0]=u;var s={};for(var l in a)hasOwnProperty.call(a,l)&&(s[l]=a[l]);s.originalType=e,s.mdxType="string"==typeof e?e:o,i[1]=s;for(var c=2;c<r;c++)i[c]=t[c];return n.createElement.apply(null,i)}return n.createElement.apply(null,t)}u.displayName="MDXCreateElement"},5162:(e,a,t)=>{t.d(a,{Z:()=>i});var n=t(7294),o=t(6010);const r="tabItem_Ymn6";function i(e){let{children:a,hidden:t,className:i}=e;return n.createElement("div",{role:"tabpanel",className:(0,o.Z)(r,i),hidden:t},a)}},5488:(e,a,t)=>{t.d(a,{Z:()=>b});var n=t(7462),o=t(7294),r=t(6010),i=t(2389),s=t(7392),l=t(7094),c=t(2466);const p="tabList__CuJ",d="tabItem_LNqP";function u(e){var a;const{lazy:t,block:i,defaultValue:u,values:b,groupId:m,className:h}=e,f=o.Children.map(e.children,(e=>{if((0,o.isValidElement)(e)&&"value"in e.props)return e;throw new Error(`Docusaurus error: Bad <Tabs> child <${"string"==typeof e.type?e.type:e.type.name}>: all children of the <Tabs> component should be <TabItem>, and every <TabItem> should have a unique "value" prop.`)})),y=b??f.map((e=>{let{props:{value:a,label:t,attributes:n}}=e;return{value:a,label:t,attributes:n}})),g=(0,s.l)(y,((e,a)=>e.value===a.value));if(g.length>0)throw new Error(`Docusaurus error: Duplicate values "${g.map((e=>e.value)).join(", ")}" found in <Tabs>. Every value needs to be unique.`);const k=null===u?u:u??(null==(a=f.find((e=>e.props.default)))?void 0:a.props.value)??f[0].props.value;if(null!==k&&!y.some((e=>e.value===k)))throw new Error(`Docusaurus error: The <Tabs> has a defaultValue "${k}" but none of its children has the corresponding value. Available values are: ${y.map((e=>e.value)).join(", ")}. If you intend to show no default tab, use defaultValue={null} instead.`);const{tabGroupChoices:v,setTabGroupChoices:N}=(0,l.U)(),[C,D]=(0,o.useState)(k),T=[],{blockElementScrollPositionUntilNextRender:x}=(0,c.o5)();if(null!=m){const e=v[m];null!=e&&e!==C&&y.some((a=>a.value===e))&&D(e)}const E=e=>{const a=e.currentTarget,t=T.indexOf(a),n=y[t].value;n!==C&&(x(a),D(n),null!=m&&N(m,String(n)))},w=e=>{var a;let t=null;switch(e.key){case"ArrowRight":{const a=T.indexOf(e.currentTarget)+1;t=T[a]??T[0];break}case"ArrowLeft":{const a=T.indexOf(e.currentTarget)-1;t=T[a]??T[T.length-1];break}}null==(a=t)||a.focus()};return o.createElement("div",{className:(0,r.Z)("tabs-container",p)},o.createElement("ul",{role:"tablist","aria-orientation":"horizontal",className:(0,r.Z)("tabs",{"tabs--block":i},h)},y.map((e=>{let{value:a,label:t,attributes:i}=e;return o.createElement("li",(0,n.Z)({role:"tab",tabIndex:C===a?0:-1,"aria-selected":C===a,key:a,ref:e=>T.push(e),onKeyDown:w,onFocus:E,onClick:E},i,{className:(0,r.Z)("tabs__item",d,null==i?void 0:i.className,{"tabs__item--active":C===a})}),t??a)}))),t?(0,o.cloneElement)(f.filter((e=>e.props.value===C))[0],{className:"margin-top--md"}):o.createElement("div",{className:"margin-top--md"},f.map(((e,a)=>(0,o.cloneElement)(e,{key:a,hidden:e.props.value!==C})))))}function b(e){const a=(0,i.Z)();return o.createElement(u,(0,n.Z)({key:String(a)},e))}},9603:(e,a,t)=>{t.r(a),t.d(a,{assets:()=>l,contentTitle:()=>i,default:()=>g,frontMatter:()=>r,metadata:()=>s,toc:()=>c});var n=t(7462),o=(t(7294),t(3905));t(5488),t(5162);const r={description:"Working With Couchbase Lite Databases With Dart",related_content:[{name:"Blobs",url:"/blobs"},{name:"Documents",url:"/documents"}]},i="Databases",s={unversionedId:"databases",id:"databases",title:"Databases",description:"Working With Couchbase Lite Databases With Dart",source:"@site/docs/databases.mdx",sourceDirName:".",slug:"/databases",permalink:"/databases",draft:!1,editUrl:"https://github.com/cbl-dart/cbl-dart/tree/main/docs/docs/databases.mdx",tags:[],version:"current",frontMatter:{description:"Working With Couchbase Lite Databases With Dart",related_content:[{name:"Blobs",url:"/blobs"},{name:"Documents",url:"/documents"}]},sidebar:"sidebar",previous:{title:"General Concepts",permalink:"/general-concepts"},next:{title:"Pre-built Database",permalink:"/prebuilt-database"}},l={},c=[{value:"Create or Open Database",id:"create-or-open-database",level:2},{value:"Close Database",id:"close-database",level:2},{value:"Database Encryption",id:"database-encryption",level:2},{value:"Enabling",id:"enabling",level:3},{value:"Persiting",id:"persiting",level:3},{value:"Opening",id:"opening",level:3},{value:"Changing",id:"changing",level:3},{value:"Removing",id:"removing",level:3},{value:"Database Maintenance",id:"database-maintenance",level:2},{value:"Command Line Tool",id:"command-line-tool",level:2},{value:"Couchbase Lite for VSCode",id:"couchbase-lite-for-vscode",level:2},{value:"Troubleshooting",id:"troubleshooting",level:2}],p=e=>function(a){return console.warn("Component "+e+" was not imported, exported, or provided by MDXProvider as global scope"),(0,o.kt)("div",a)},d=p("CodeExample"),u=p("APITabs"),b=p("APITab"),m=p("EnterpriseFeatureCallout"),h=p("EmbedderTabs"),f=p("EmbedderTab"),y={toc:c};function g(e){let{components:a,...t}=e;return(0,o.kt)("wrapper",(0,n.Z)({},y,t,{components:a,mdxType:"MDXLayout"}),(0,o.kt)("h1",{id:"databases"},"Databases"),(0,o.kt)("metaheader",null),(0,o.kt)("h2",{id:"create-or-open-database"},"Create or Open Database"),(0,o.kt)("p",null,"You can create a new database and-or open an existing database, using the\n",(0,o.kt)("a",{parentName:"p",href:"https://pub.dev/documentation/cbl/latest/cbl/Database-class.html"},(0,o.kt)("inlineCode",{parentName:"a"},"Database"))," class. The database class provides both synchronous and\nasynchronous methods for opening and closing databases (see\n",(0,o.kt)("a",{parentName:"p",href:"/general-concepts#sync-and-async-apis"},"explanation for Synchronous and Asynchronous APIs"),").\nJust pass in a database name and optionally a ",(0,o.kt)("a",{parentName:"p",href:"https://pub.dev/documentation/cbl/latest/cbl/DatabaseConfiguration-class.html"},(0,o.kt)("inlineCode",{parentName:"a"},"DatabaseConfiguration"))," - see\n",(0,o.kt)("a",{parentName:"p",href:"#example-1"},"Example 1"),"."),(0,o.kt)("p",null,"Things to watch for include:"),(0,o.kt)("ul",null,(0,o.kt)("li",{parentName:"ul"},(0,o.kt)("p",{parentName:"li"},"If the named database does not exist in the specified, or default, location\nthen a new one is created.")),(0,o.kt)("li",{parentName:"ul"},(0,o.kt)("p",{parentName:"li"},"The database is created in a default location unless you specify a directory\nfor it \u2014\u2009see: ",(0,o.kt)("a",{parentName:"p",href:"https://pub.dev/documentation/cbl/latest/cbl/DatabaseConfiguration/directory.html"},(0,o.kt)("inlineCode",{parentName:"a"},"DatabaseConfiguration.directory")),"."),(0,o.kt)("admonition",{parentName:"li",type:"tip"},(0,o.kt)("p",{parentName:"admonition"},"Best Practice is to always specify the path to the database explicitly.")),(0,o.kt)("p",{parentName:"li"},"See ",(0,o.kt)("a",{parentName:"p",href:"/supported-platforms"},"Supported Platforms")," for the default location\nfor each platform."))),(0,o.kt)(d,{id:1,title:"Opening a Database",mdxType:"CodeExample"},(0,o.kt)(u,{mdxType:"APITabs"},(0,o.kt)(b,{api:"Async",mdxType:"APITab"},(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-dart"},"final database = await Database.openAsync('my-database');\n"))),(0,o.kt)(b,{api:"Sync",mdxType:"APITab"},(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-dart"},"final database = Database.openSync('my-database');\n"))))),(0,o.kt)("h2",{id:"close-database"},"Close Database"),(0,o.kt)("p",null,"You are advised to incorporate the closing of all open database into your\napplication workflow."),(0,o.kt)("p",null,"Closing a database is simple, just call use ",(0,o.kt)("a",{parentName:"p",href:"https://pub.dev/documentation/cbl/latest/cbl/Database/close.html"},(0,o.kt)("inlineCode",{parentName:"a"},"Database.close")),". See\n",(0,o.kt)("a",{parentName:"p",href:"#example-2"},"Example 2"),". This also closes active replications, listeners, and-or live\nqueries connected to the database."),(0,o.kt)(d,{id:2,title:"Closing a Database",mdxType:"CodeExample"},(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-dart"},"await database.close();\n"))),(0,o.kt)("h2",{id:"database-encryption"},"Database Encryption"),(0,o.kt)(m,{mdxType:"EnterpriseFeatureCallout"}),(0,o.kt)("p",null,"Couchbase Lite includes the ability to encrypt Couchbase Lite databases. This\nallows mobile applications to secure data at rest, when it is being stored on\nthe device. The algorithm used to encrypt the database is 256-bit AES."),(0,o.kt)("h3",{id:"enabling"},"Enabling"),(0,o.kt)("p",null,"To enable encryption, use ",(0,o.kt)("a",{parentName:"p",href:"https://pub.dev/documentation/cbl/latest/cbl/DatabaseConfiguration/encryptionKey.html"},(0,o.kt)("inlineCode",{parentName:"a"},"DatabaseConfiguration.encryptionKey"))," to set the\nencryption key of your choice. Provide this encryption key every time the\ndatabase is opened - see ",(0,o.kt)("a",{parentName:"p",href:"#example-3"},"Example 3"),"."),(0,o.kt)(d,{id:3,title:"Opening an Encrypted Database",mdxType:"CodeExample"},(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-dart"},"final key = await EncryptionKey.passwordAsync('secret password');\nfinal config = DatabaseConfiguration(encryptionKey: key);\nfinal database = await Database.openAsync('my-database', config);\n"))),(0,o.kt)("h3",{id:"persiting"},"Persiting"),(0,o.kt)("p",null,"Couchbase Lite does not persist the key. It is the application's responsibility\nto manage the key and store it in a platform specific secure store such as\nApple's\n",(0,o.kt)("a",{parentName:"p",href:"https://developer.apple.com/documentation/security/keychain_services"},"Keychain"),"\nor Android's\n",(0,o.kt)("a",{parentName:"p",href:"https://developer.android.com/training/articles/keystore"},"Keystore"),"."),(0,o.kt)("h3",{id:"opening"},"Opening"),(0,o.kt)("p",null,"An encrypted database can only be opened with the same language SDK that was\nused to encrypt it in the first place. So a database encrypted using the Dart\nSDK, and then exported, is readable only by the Dart or C SDK."),(0,o.kt)("h3",{id:"changing"},"Changing"),(0,o.kt)("p",null,"To change an existing encryption key, open the database using its existing\nencryption-key and use ",(0,o.kt)("a",{parentName:"p",href:"https://pub.dev/documentation/cbl/latest/cbl/Database/changeEncryptionKey.html"},(0,o.kt)("inlineCode",{parentName:"a"},"Database.changeEncryptionKey"))," to set the required\nnew encryption-key value."),(0,o.kt)("h3",{id:"removing"},"Removing"),(0,o.kt)("p",null,"To remove encryption, open the database using its existing encryption-key and\nuse ",(0,o.kt)("a",{parentName:"p",href:"https://pub.dev/documentation/cbl/latest/cbl/Database/changeEncryptionKey.html"},(0,o.kt)("inlineCode",{parentName:"a"},"Database.changeEncryptionKey"))," with a ",(0,o.kt)("inlineCode",{parentName:"p"},"null")," value as the encryption\nkey."),(0,o.kt)("h2",{id:"database-maintenance"},"Database Maintenance"),(0,o.kt)("p",null,"From time to time it may be necessary to perform certain maintenance activities\non your database, for example to compact the database file, removing unused\ndocuments and blobs no longer referenced by any documents."),(0,o.kt)("p",null,"Couchbase Lite's API provides the ",(0,o.kt)("a",{parentName:"p",href:"https://pub.dev/documentation/cbl/latest/cbl/Database/performMaintenance.html"},(0,o.kt)("inlineCode",{parentName:"a"},"Database.performMaintenance"))," method. The\navailable maintenance operations, including compact are as shown in the enum\n",(0,o.kt)("a",{parentName:"p",href:"https://pub.dev/documentation/cbl/latest/cbl/MaintenanceType.html"},(0,o.kt)("inlineCode",{parentName:"a"},"MaintenanceType"))," to accomplish this."),(0,o.kt)("p",null,"This is a resource intensive operation and is not performed automatically. It\nshould be run on-demand using the API. If in doubt, consult Couchbase support."),(0,o.kt)("h2",{id:"command-line-tool"},"Command Line Tool"),(0,o.kt)("p",null,"cblite is a command-line tool for inspecting and querying Couchbase Lite\ndatabases."),(0,o.kt)("p",null,"You can download and build it from the couchbaselabs\n",(0,o.kt)("a",{parentName:"p",href:"https://github.com/couchbaselabs/couchbase-mobile-tools/blob/master/README.cblite.md"},"GitHub repository"),".\nNote that the cblite tool is not supported by the\n",(0,o.kt)("a",{parentName:"p",href:"https://www.couchbase.com/support-policy"},"Couchbase Support Policy"),"."),(0,o.kt)("h2",{id:"couchbase-lite-for-vscode"},"Couchbase Lite for VSCode"),(0,o.kt)("p",null,"Couchbase Lite for VSCode is a Visual Studio Code extension that provides a user\ninterface for inspecting and querying Couchbase Lite databases. You can find\nmore information about this extension from it's\n",(0,o.kt)("a",{parentName:"p",href:"https://github.com/couchbaselabs/vscode-cblite"},"GitHub repository"),"."),(0,o.kt)("h2",{id:"troubleshooting"},"Troubleshooting"),(0,o.kt)("p",null,"You should use console logs as your first source of diagnostic information. If\nthe information in the default logging level is insufficient you can focus it on\ndatabase errors and generate more verbose messages (see ",(0,o.kt)("a",{parentName:"p",href:"https://pub.dev/documentation/cbl/latest/cbl/LogLevel.html"},(0,o.kt)("inlineCode",{parentName:"a"},"LogLevel")),")\n\u2014\u2009see: ",(0,o.kt)("a",{parentName:"p",href:"#example-4"},"Example 4"),"."),(0,o.kt)(d,{id:4,title:"Increase level of Database Log Messages",mdxType:"CodeExample"},(0,o.kt)(h,{mdxType:"EmbedderTabs"},(0,o.kt)(f,{embedder:"Dart",mdxType:"EmbedderTab"},(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-dart"},"Database.log.console.level = LogLevel.verbose;\n")),(0,o.kt)("admonition",{type:"note"},(0,o.kt)("p",{parentName:"admonition"},"On standalone Dart, logging is configured to directly log to stdandard output\nand does not go through Dart."))),(0,o.kt)(f,{embedder:"Flutter",mdxType:"EmbedderTab"},(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-dart"},"Database.log.custom!.level = LogLevel.verbose;\n")),(0,o.kt)("admonition",{type:"note"},(0,o.kt)("p",{parentName:"admonition"},"On Flutter, logging is configured to use a custom logger that calls Dart's\n",(0,o.kt)("a",{parentName:"p",href:"https://api.dart.dev/dart-core/print.html"},(0,o.kt)("inlineCode",{parentName:"a"},"print"))," function. Console logging is disabled. This is because\nnot all Flutter platforms (e.g. Android) support console logging."))))))}g.isMDXComponent=!0}}]);