"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[339],{8522:(e,r,t)=>{t.d(r,{J:()=>a,b:()=>l});var n=t(7294);const a=n.createContext({});function l(){return n.useContext(a)}},8573:(e,r,t)=>{t.d(r,{Z:()=>o});var n=t(7462),a=t(2389),l=t(1170),c=t(5864),i=t(7294);function o(e){let{children:r,...t}=e;const o=(0,a.Z)(),u=function(e){return i.Children.toArray(e).some((e=>(0,i.isValidElement)(e)))?e:Array.isArray(e)?e.join(""):e}(r),s="string"==typeof u&&!u.trim().includes("\n"),m=void 0!==t.showLineNumbers?Boolean(t.showLineNumbers):!s,d="string"==typeof u?c.Z:l.Z;return i.createElement(d,(0,n.Z)({key:String(o)},t,{showLineNumbers:m}),u)}},718:(e,r,t)=>{t.r(r),t.d(r,{default:()=>c});var n=t(2047),a=t(7294),l=t(8522);function c(e){return a.createElement(l.J.Provider,{value:e.content},a.createElement(n.Z,e))}},5593:(e,r,t)=>{t.d(r,{Z:()=>p});var n=t(5162),a=t(5488),l=t(7294);var c=t(7462);const i="figure_sS9H",o="caption_Uq9b";function u(e){let r="example"===e.type?"Example":"Figure";return l.createElement("figure",{className:i,id:`${e.type}-${e.id}`},l.createElement("figcaption",{className:o},r," ",e.id,". ",e.title??e.richTitle),e.children)}var s=t(3612);var m=t(8522);const d="metaHeader_An6d";const p={...t(2435).Z,CodeExample:function(e){return l.createElement(u,(0,c.Z)({type:"example"},e))},Figure:function(e){return l.createElement(u,(0,c.Z)({type:"figure"},e))},metaheader:function(){const e=(0,m.b)().frontMatter,r=e.description,t=e.abstract,n=e.related_content;return r||n?l.createElement("div",{className:d},r&&l.createElement("div",null,"Description \u2014 ",l.createElement("em",null,r)),t&&l.createElement("div",null,"Abstract \u2014 ",l.createElement("em",null,t)),n&&l.createElement("div",null,"Related Content \u2014"," ",n.map(((e,r)=>{let{name:t,url:a}=e;return l.createElement(l.Fragment,{key:r},l.createElement("a",{href:a},t),r<n.length-1&&" | ")})))):l.createElement(l.Fragment,null)},EnterpriseFeatureCallout:function(){return l.createElement(s.Z,{type:"info",title:"Important"},l.createElement("p",null,"This feature is an"," ",l.createElement("a",{href:"https://www.couchbase.com/products/editions#cmobile",target:"_blank",rel:"noopener noreferrer"},"Enterprise Edition")," ","feature."))},APITab:function(e){return l.createElement(l.Fragment,null,e.children)},APITabs:function(e){return l.createElement(a.Z,{groupId:"async-sync-api"},l.Children.map(e.children,(e=>{if(!function(e){return!!e.props.api}(e))throw new Error('Every APITab must have an api property set to "Async" or "Sync".');return l.createElement(n.Z,{value:e.props.api.toLowerCase(),label:e.props.api,children:e.props.children})})))},EmbedderTab:function(e){return l.createElement(l.Fragment,null,e.children)},EmbedderTabs:function(e){return l.createElement(a.Z,{groupId:"embedder"},l.Children.map(e.children,(function(e){if(!function(e){return!!e.props.embedder}(e))throw new Error('Every EmbedderTab must have an embedder property set to "Dart" or "Flutter".');return l.createElement(n.Z,{value:e.props.embedder.toLowerCase(),label:e.props.embedder,children:e.props.children})})))}}}}]);