<?xml version="1.0" encoding="US-ASCII"?>
<document xmlns:c="MACRO_namespace_iepd_catalog"
	xmlns:er="urn:oasis:names:tc:entity:xmlns:xml:catalog" xmlns:nc="MACRO_namespace_nc"
	xmlns:structures="MACRO_namespace_structures" xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns="https://iead.ittl.gtri.org/wr24/doc/2011-09-30-2258">

	<title>National Information Exchange Model <char name="mdash"/> Information Exchange Package
		Documentation Specification</title>
	<version>MACRO_document_version</version>
	<date>2021-03-22</date>
	<author>NIEM Technical Architecture Committee (NTAC)</author>

	<!-- ################################################################# -->

	<subsection>
		<title>Abstract</title>

		<p>This document specifies normative rules and non-normative guidance for building a National Information Exchange Model (NIEM) information exchange package documentation (IEPD).</p>
	</subsection>

	<subsection>
		<title>Status</title>

		<p>This document deprecates the Model Package Description (MPD) construct as of NIEM 5.0.</p>
		<p>This specification represents the work of the NIEM Technical Architecture Committee
			(NTAC), the NIEM Business Architecture Committee (NBAC), and their predecessors. It is a
			product of the NIEM Management Office (NMO).</p>
		<p>Email comments on this specification to <link
				href="mailto:information@niem.gov?subject=NIEM%20IEPD%20Specification%20Version%20[[[]]]MACRO_document_version"
				>information@niem.gov</link> or submit them via the <link
				href="https://github.com/NIEM/MPD-Spec/issues">GitHub issue tracker</link>.</p>
	</subsection>

	<subsection>
		<title>Contents</title>
		<tableOfContents/>
	</subsection>


	<!-- ######################## Introduction ############################ -->


	<section id="Introduction">
		<title>Introduction</title>

		<p>This specification defines rules and practices for constructing and packaging a National
			Information Exchange Model (NIEM)<termRef
				term="information exchange package documentation">information exchange package
				documentation</termRef> (IEPD). To the NIEM program, the <termRef
				term="information exchange package documentation">IEPD</termRef> is considered the
			point of interoperability.</p>

		<p>This specification assumes familiarity with NIEM, its basic concepts, architecture,
			processes, design rules, and general conformance rules. NIEM training and reference
			materials are located on the <ref idref="NIEM-TechHub"/>. In addition to those
			materials, readers of this specification may wish to be familiar with the current versions of the following:</p>
		<ul>
			<li>
				<p>
					<ref idref="NIEM-Conformance"/>
				</p>
			</li>
			<li>
				<p>
					<ref idref="NIEM-CTAS"/>
				</p>
			</li>
			<li>
				<p>
					<ref idref="NIEM-NDR"/>
				</p>
			</li>
			<li>
				<p>
					<ref idref="NIEM-CodeLists"/>
				</p>
			</li>
			<li>
				<p>
					<ref idref="NIEM-HLVA"/>
				</p>
			</li>
		</ul>

		<p>This specification uses and is a peer to the <ref idref="NIEM-NDR"/>.</p>

		<section id="Background">
			<title>Background</title>

			<p>An <termRef term="information exchange package documentation">IEPD</termRef> is a
				normative specification for XML <termRef term="data component">data
					components</termRef> in the format of the World Wide Web Consortium (W3C) XML
				Schema Definition Language <ref idref="W3-XML-Schema-Datatypes"/>, <ref
					idref="W3-XML-Schema-Structures"/>. <termRef
					term="information exchange package documentation">IEPD</termRef> schema
				documents define implementable
				NIEM exchange instance XML documents in W3C Extensible Markup Language (XML) <ref
					idref="W3-XML"/>.</p>

			<p>An <termRef term="information exchange package documentation">IEPD</termRef> is ready
				to publish and use when it conforms to NIEM specifications, and has been properly
				packaged with the schemas, documentation, and supplemental files needed to implement
				or reuse it. <termRef term="information exchange package documentation"
					>IEPD</termRef> content design, development, and assembly may be difficult and
				time-consuming, especially if done manually. Developers will often prefer to build
				and modify an IEPD with the help of software tools, which can significantly reduce
				the complexity of designing, constructing, changing, and managing IEPDs. In order to
				reduce ambiguity and to facilitate interoperable and effective tool support, this
				baseline specification imposes some degree of consistency on the terminology,
				syntax, semantics, and composition of IEPDs.</p>

		</section>


		<section id="Purpose">
			<title>Purpose</title>

			<p>This document is a normative specification for NIEM <termRef>information exchange
					package documentation</termRef> (IEPD). The rules and guidance herein are
				designed to encourage and facilitate NIEM use and tools by balancing consistency,
				simplicity, and flexibility. Consistency and simplicity make IEPDs easy to design
				correctly, build rapidly, and find easily (for reuse or adaptation). Consistency
				also facilitates tool support. Flexibility enables more latitude to design and
				tailor IEPDs for complex data exchange requirements. As such, this document does not
				necessarily prescribe mandates or rules for all possible situations or
				organizational needs. If an organization desires to impose additional requirements
				or constraints on its IEPDs beyond those specified in this document (for example,
				mandate that an <termRef term="information exchange package documentation"
					>IEPD</termRef> contain a normative set of business requirements or a domain
				model), then it is free to do so, as long as no conflicts exist with this
				specification or the <ref idref="NIEM-NDR"/>.</p>

			<p>This document defines terminology; identifies required and optional (but common)
				artifacts; defines metadata; specifies normative constraints, schemes, syntax, and
				processes as rules; provides non-normative guidance; and as needed, refers to other
				related NIEM specifications for more detail.</p>

		</section>


		<section id="Scope">
			<title>Scope</title>

			<p>This specification applies to all NIEM <termRef
					term="information exchange package documentation">information exchange package
					documentation</termRef> (IEPD), and in particular it focuses on the normative
				rules for IEPDs.</p>

			<p>NIEM is a data layer for an information architecture. Files in an <termRef
					term="information exchange package documentation">IEPD</termRef> generally
				define XML Schema types and declare XML elements and attributes to use in payloads
				for information exchanges. While an <termRef
					term="information exchange package documentation">IEPD</termRef> may also
				contain files from layers beyond the data layer, this specification is not intended
				to define details of other architectural layers. Such files are generally present
				only to provide additional context, understanding, or assistance for implementing
				the exchange of payloads.</p>

			<p>This specification defines several incremental stages of conformance to support
				iterative <termRef term="information exchange package documentation">IEPD</termRef>
				development, with conformance testing possible at each step instead of delayed to
				the end. Tool vendors should be able to build, adapt, and integrate software tools
				to assist in <termRef term="information exchange package documentation"
					>IEPD</termRef> development and assembly, from raw parts to finished
				product.</p>

				<p>This specification provides a standard version numbering scheme <ref
					idref="Version-Numbering-Scheme"/>. However, it does not provide guidance
					for managing or processing <termRef
					term="information exchange package documentation">IEPD</termRef> versions or
					their associated <termRef term="information exchange package">information exchange packages</termRef> (<termRef term="information exchange package">IEPs</termRef>).
					Creation and management of <termRef
					term="information exchange package documentation">IEPDs</termRef> is the
					responsibility of stakeholders and developers. As such, <termRef
					term="information exchange package documentation">IEPDs</termRef> have their
					own versioning processes, and are managed independently of the NIEM core and
					domains. The NIEM Management Office defines <termRef
					term="information exchange package documentation">IEPD</termRef>
					conformance, but <termRef term="information exchange package documentation"
					>IEPD</termRef> development and management fall outside its scope.
					Nonetheless, the NIEM Management Office has developed guidance (through the
					NTAC) for managing <termRef term="information exchange package documentation"
					>IEPDs</termRef>, versioning <termRef
					term="information exchange package documentation">IEPDs</termRef>, and
					processing their associated <termRef term="information exchange package"
					>IEPs</termRef>. This reference material can be found at
					<link>https://niem.github.io/reference/artifacts/messages/iepd/</link>.</p>

				<p>An <termRef term="information exchange package documentation">IEPD</termRef>
					defines one or more data exchanges, each occurring in the form of an
						<termRef term="information exchange package">IEP</termRef>. This specification
					supports a variety of data exchange use cases, in which the <termRef
						term="information exchange package">IEP</termRef> may be:</p>
				<ul>
					<li>
						<p>An XML document with a NIEM-defined XML document element.</p>
					</li>
					<li>
						<p>An XML document with a NIEM-defined payload element wrapped inside a
							non-NIEM envelope element (for example, SOAP, <ref idref="LEXS"/>
							(LEXS), Trusted Data Format (TDF), or an OGC Web Service document
							element).</p>
					</li>
					<li>
						<p>Multiple NIEM-defined payloads packaged together in a single
							document.</p>
					</li>
				</ul>
			
				<p>IEPD developers are not required to revise IEPDs that existed before this
				specification becomes effective. However, they are always encouraged to consider
				revising an IEPD to meet this specification, especially when making other
				significant changes.</p>

		</section>


		<section id="Audience">
			<title>Audience</title>

			<p>The following groups should review and be familiar with this specification:</p>
			<ul>
				<li>
					<p>NIEM <termRef term="information exchange package documentation"
							>IEPD</termRef> developers, reviewers, individuals or groups responsible
						for approving IEPDs, and implementers.</p>
				</li>
				<li>
					<p>NIEM-aware tool developers.</p>
				</li>
			</ul>

		</section>
	</section>


	<!-- ####################### Concepts and Terminology #################### -->


	<section id="Concepts-and-Terminology">
		<title>Basic Concepts and Terminology</title>

		<p>The section defines and discusses baseline terms and concepts that will be used
			throughout this document. Presentation in this section is sequenced for understanding.
			Each subsection builds upon previous ones.</p>


		<section id="IETF-Best-Current-Practice-14-terminology">
			<title>IETF Best Current Practice 14 terminology</title>

			<p>The key words MUST, MUST NOT, SHALL, SHALL NOT, SHOULD, SHOULD NOT, MAY, RECOMMENDED,
				REQUIRED, and OPTIONAL in this document are to be interpreted as described in <ref
					idref="BCP14"/><ref idref="RFC2119"/><ref idref="RFC8174"/>.</p>

		</section>


		<section id="Character-Case-Sensitivity">
			<title>Character Case Sensitivity</title>

			<p>This specification imposes many constraints on the syntax for identifiers, names,
				labels, strings, etc. In all cases, unless otherwise explicitly noted, syntax is
				case sensitive. In particular, XML files in appendices that define particular
				artifacts, transformations, and examples are case sensitive.</p>

			<p>Also, note that as a general principle, lower case characters are used whenever such
				will not conflict with the <ref idref="NIEM-NDR"/>.</p>

		</section>


		<section id="Artifacts">
			<title>Artifacts</title>

			<p>IEPDs are generally composed of files and file sets grouped for a particular purpose.
				Each file is referred to as an <termRef>artifact</termRef>, and each logical set of
				such files is called an <termRef>artifact set</termRef>.</p>

			<definition term="artifact">
				<p>A single file with a defined purpose.</p>
			</definition>

			<definition term="artifact set">
				<p>A collection of artifacts logically grouped for a defined purpose.</p>
			</definition>

			<p>An <termRef term="information exchange package documentation">IEPD</termRef> is
				itself an <termRef>artifact set</termRef>, the purpose for which is to define and
				document the intended use of the <termRef
					term="information exchange package documentation">IEPD</termRef>. While the key
					<termRef term="information exchange package documentation">IEPD</termRef>
				artifacts are its <termRef>XML schema document</termRef> artifacts, there are also
				other kinds of <termRef term="information exchange package documentation"
					>IEPD</termRef> artifacts. These may include (but are not limited to) HTML,
				XSLT, text, or graphic files used for human-readable documentation. An <termRef
					term="information exchange package documentation">IEPD</termRef> may also have
				artifacts intended to help assist in or accelerate the use and implementation of the
					<termRef term="information exchange package documentation">IEPD</termRef>. For
				example, these may be XML, UML, or binary files that are inputs to or outputs from
				software tools used to build, generate, or edit the <termRef
					term="information exchange package documentation">IEPD</termRef> or its schema
				document artifacts. <ref idref="IEPD-Artifacts"/> contains a listing of mandatory
				and common optional artifacts for IEPDs. Common types of artifacts are described in
				more detail in subsequent sections. <ref idref="Artifact-Sets"/> discusses the
				different methods for grouping <termRef
					term="information exchange package documentation">IEPD</termRef> artifacts into
				sets.</p>

		</section>


		<section id="Schema-Namespace-Correspondence-in-NIEM">
			<title>Schema Document and Namespace Correspondence in NIEM</title>

			<p>To simplify automatic schema processing and reduce the potential for confusion and
				error, <ref idref="NIEM-NDR"/> principles state that each NIEM-conformant namespace
				SHOULD be defined by exactly one reference or extension schema document. To support
				this concept, the <ref idref="NIEM-NDR"/> disallows the use of
					<qName>xs:include</qName>, and mandates the use of the
					<code>xs:schema/@targetNamespace</code> attribute in NIEM-conformant schema
				documents.</p>

			<p>So, (1) each NIEM namespace is defined by a single NIEM-conformant schema document,
				and (2) each NIEM-conformant schema document declares a target namespace. NIEM does
				not permit schema documents without target namespaces, unless they are from sources
				outside of NIEM (e.g., an <termRef>external schema document</termRef>).</p>

		</section>



		<section id="Namespaces">
			<title>Namespaces Used in this Specification</title>

			<p>The following namespaces are referenced and used in this specification:</p>

			<figure>
				<title>Namespaces Used</title>
				<pre>c           MACRO_namespace_iepd_catalog
er	    urn:oasis:names:tc:entity:xmlns:xml:catalog
nc	    MACRO_namespace_nc
structures  MACRO_namespace_structures
xs          http://www.w3.org/2001/XMLSchema</pre>
			</figure>

		</section>

		<section id="XML-Validation">
			<title>XML Validation</title>

			<p>A discussion of XML validation requires an understanding of basic XML terminology.
				The following definitions are necessary.</p>

			<definition term="XML document">
				<p>A document in XML format.</p>
				<p>(as defined by <ref idref="W3-XML"/>, <a
						href="http://www.w3.org/TR/2008/REC-xml-20081126/#dt-xml-doc">
						<char name="sect"/>2, <q>Documents</q></a>)</p>
			</definition>

			<definition term="schema component">
				<p>The generic term for the building blocks that comprise the abstract data model of
					a schema.</p>
				<p>(as defined by <ref idref="W3-XML-Schema-Structures"/>, <a
						href="http://www.w3.org/TR/2004/REC-xmlschema-1-20041028/#key-schema">
						<char name="sect"/>2.2, <q>XML Schema Abstract Data Model</q></a>)</p>
			</definition>

			<definition term="XML Schema">
				<p>A set of schema components.</p>
				<p>(as defined by <ref idref="W3-XML-Schema-Structures"/>, <a
						href="http://www.w3.org/TR/2004/REC-xmlschema-1-20041028/#key-schema">
						<char name="sect"/>2.2, <q>XML Schema Abstract Data Model</q></a>)</p>
			</definition>

			<definition term="XML schema validation">
				<p>The process of checking an <termRef>XML document</termRef> to confirm that it is
					both <em>well-formed</em> (as defined by <ref idref="W3-XML"/>, <a
						href="http://www.w3.org/TR/2008/REC-xml-20081126/#sec-well-formed">
						<char name="sect"/>2.1, <q>Well-Formed XML Documents</q></a>) and
						<em>valid</em> (as defined by <ref idref="W3-XML-Schema-Structures"/>, <a
						href="http://www.w3.org/TR/2004/REC-xmlschema-1-20041028/#concepts-schemaConstraints">
						<char name="sect"/>2.3, <q>Constraints and Validation Rules</q></a>), in
					that it follows the structure defined by an associated <termRef>XML
						Schema</termRef>. A well-formed document follows the syntactic rules of XML,
					which are the same for all XML documents.</p>
			</definition>

			<definition term="XML schema document">
				<p>A physical (file) representation of part or all of an <termRef>XML
						Schema</termRef>. One or more <em>XML schema documents</em> are used to
					assemble <termRef term="schema component">schema components</termRef> into an
						<termRef>XML Schema</termRef>.</p>
			</definition>

			<definition term="XML schema assembly">
				<p>A process that uses <termRef term="XML schema document">XML schema
						documents</termRef> to identify the constituent <termRef
						term="schema component">schema components</termRef> for an <termRef>XML
						Schema</termRef>, and correctly sequences and structures these components to
					construct a single entity, the <termRef>XML Schema</termRef>.</p>
			</definition>

			<p>In other words, an <termRef>XML Schema</termRef> is the result of <termRef>XML schema
					assembly</termRef>, i.e., processing a set of one or more <termRef
					term="XML schema document">XML schema documents</termRef> into a single conceptual entity.
				That entity is most commonly substantiated as an electronic image in the memory of a computer.</p>

			<p>This specification often refers to the process of <termRef>XML schema validation</termRef>, 
				that is, validation of an instance XML document to confirm
				it adheres to the structure defined by a particular <termRef>XML Schema</termRef>.
				Generally, this should occur periodically during and after design time to ensure the
				conformance and quality of an information exchange definition (i.e., <termRef
					term="XML schema document">XML schema documents</termRef>) and associated
				instance XML documents. However, local architecture or policy may dictate the need
				to validate more often, and in some cases may even require runtime validation. To be
				clear, NIEM conformance does not require that instance documents be validated at
				runtime.</p>

			<p>XML schema document sets that define a NIEM information exchange must be
				authoritative. Application developers may use other schemas (e.g., constraint or
				Schematron schema documents) for various purposes, but for the purposes of
				determining NIEM conformance, the authoritative reference schema documents (NIEM
				releases) are relevant. This does not mean that XML validation must be performed on
				all instance XML documents as they are served or consumed; only that the instance
				XML documents validate if and when XML validation is performed. Therefore, even when
				validation is not performed, instance XML documents must be valid against the XML
				schema that is assembled from XML schema document sets that specify these instance
				XML documents.</p>

		</section>

		<section id="Reference-Schema-Document">
			<title>Reference Schema Documents</title>

			<definition term="reference schema document">
				<p>As defined by <ref idref="NIEM-NDR"/>:</p>
				<blockquote>
					<p>An <termRef>XML schema document</termRef> that is intended to provide the
						authoritative definitions of broadly reusable <termRef
							term="schema component">schema components</termRef>.</p>
				</blockquote>
			</definition>

			<p>A NIEM <termRef>reference schema document</termRef> is an <termRef>XML schema
				document</termRef> that is intended to be the authoritative definition schema for a namespace. Examples include NIEM Core and NIEM domains.
				A reference schema document meets all of the following criteria:</p>
			<ul>
				<li>
					<p>It is a NIEM conformant schema document.</p>
				</li>
				<li>
					<p>It is explicitly designated as a reference schema document by its own
						conformance targets attribute. This can be declared by an <termRef>IEPD
							catalog document</termRef> or by a tool-specific mechanism outside the
						schema document.</p>
				</li>
				<li>
					<p>It provides the broadest, most fundamental definitions of <termRef
							term="data component">data components</termRef> in its namespace.</p>
				</li>
				<li>
					<p>It provides the authoritative definition of business semantics for <termRef
							term="data component">data components</termRef> in its namespace.</p>
				</li>
				<li>
					<p>It is intended to serve as a basis for components in <termRef
							term="information exchange package documentation">IEPD</termRef> schema
						documents, including <termRef term="schema document subset">schema document
							subsets</termRef>, <termRef term="constraint schema document set"
							>constraint schema document sets</termRef>, and <termRef
							term="extension schema document">extension schema
						documents</termRef>.</p>
				</li>
			</ul>

			<definition term="reference schema document set">
				<p>A set of related <termRef term="reference schema document">reference schema
						documents</termRef>, such as a NIEM release.</p>
			</definition>

			<p>The <ref idref="NIEM-NDR"/> conformance rules for reference schema documents are
				generally stricter than those for other classes of NIEM-conformant schema documents.
				For example, <termRef term="reference schema document">reference schema
					documents</termRef> are not allowed to employ particular XML Schema model groups
				such as <qName>xs:choice</qName> or <qName>xs:any</qName> that other schema
				documents may contain.</p>

			<p>NIEM reference schemas are very uniform in their structure. As they are the primary
				definitions for <termRef term="data component">data components</termRef>, they do
				not need to restrict other data definitions, and so they are not allowed to use XML
					Schema<char name="rsquo"/>s complex type restriction mechanisms.</p>
			
			<definition term="data component">
				<p>An XML Schema type or attribute group definition; or an XML Schema element or
					attribute declaration.</p>
			</definition>

		</section>


		<!-- ###################### Rules ############################ -->


		<section id="Rules">
			<title>Rules</title>

			<p>Rules define specific constraints on artifacts or on the interpretation of artifacts.
				The classes of artifacts are identified by <termRef term="conformance target"
					>conformance targets</termRef> that are enumerated by this document in <ref
					idref="CT"/>. Rules are normative.</p>

			<bogusRule section="&lt;section&gt;" number="&lt;number&gt;"
				applicability="&lt;applicability&gt;" class="&lt;class&gt;">
				<p>An enforceable rule for NIEM.</p>
			</bogusRule>

			<p>Each rule has a classification, which is either <em>Constraint</em> or
					<em>Interpretation</em>. These terms are defined below:</p>

			<definition term="constraint rule">
				<p>A rule that sets a requirement on an artifact with respect to its conformance to
					a <termRef>conformance target</termRef>.</p>
			</definition>

			<definition term="interpretation rule">
				<p>A rule that sets the methodology, pattern, or procedure for understanding or
					using some aspect of an instance of a conformance target.</p>
			</definition>

			<p>Each rule may apply to one or more <termRef term="conformance target">conformance
					targets</termRef>. Each rule lists its applicable <termRef
					term="conformance target">conformance target(s)</termRef> encoded per <ref
					idref="ct-codes"/>. The conformance targets for this specification are detailed
				in <ref idref="CT"/>.</p>

			<p>Rules are numbered according to the section in which they appear and the order in
				which they appear within that section. For example, Rule 4-1 is the first rule in
				Section 4.</p>

		</section>
	</section>


	<!-- ################################ Conformance Targets ################################ -->


	<section id="CT">
		<title>Conformance Targets</title>

		<p>This section introduces <termRef term="conformance target">conformance targets</termRef>,
			a concept fundamental to understanding the normative rules defined in this
			specification. This section also defines and explains <termRef term="conformance target"
				>conformance targets</termRef> used in this specification.</p>

		<p>There are several purposes for defining conformance targets in NIEM specifications. A
				<termRef>conformance target</termRef> establishes and identifies a class of artifact
			associated with a set of rules. Based on these rules, tools and operations may be
			developed to process or use these artifacts consistently.</p>

		<p>Conformance targets also satisfy a need to ensure developers do not conform to NIEM in
			name only. Once committed to using NIEM, developers and organizations need well-defined
			conformance targets and rules to know exactly how to conform. Funding agencies require
			conformance targets that correspond to interoperability goals. An agency that is funding
			development of a set of systems will need to ensure it funds the development of
			NIEM-conformant IEPDs that support the exchange of NIEM-conformant IEPs. Tools and
			system developers need conformance targets that identify real world requirements
			corresponding to their use cases and tool capabilities. Many of these tools have not yet
			been developed. Therefore, this specification attempts to cover a broad range of general
			use cases.</p>


		<!-- ################################ CT Terms ################################ -->


		<section id="CT-Terms">
			<title>Conformance Target Terminology</title>

			<p><ref idref="NIEM-CTAS"/> defines two terms used normatively and often within this
				specification.</p>

			<definition term="conformance target">
				<p>As defined by <ref idref="NIEM-CTAS"/>:</p>
				<blockquote>
					<p>A class of artifact, such as an interface, protocol, document, platform,
						process or service, that is the subject of conformance clauses and normative
						statements. There may be several conformance targets defined within a
						specification, and these targets may be diverse so as to reflect different
						aspects of a specification. For example, a protocol message and a protocol
						engine may be different conformance targets.</p>
				</blockquote>
			</definition>

			<definition term="conformance target identifier">
				<p>As defined by <ref idref="NIEM-CTAS"/>:</p>
				<blockquote>
					<p>An internationalized resource identifier <ref idref="RFC3987-IRI"/> that
						uniquely identifies a conformance target.</p>
				</blockquote>
			</definition>

			<p>It will also be useful to define <termRef>IEPD conformance target
					identifier</termRef>.</p>

			<definition term="IEPD conformance target identifier">
				<p>A <termRef>conformance target identifier</termRef> to which a given <termRef
						term="information exchange package documentation">IEPD</termRef> claims to
					conform.</p>
			</definition>


		</section>


		<!-- ######################## CT IEPD ########################## -->


		<section id="CT-IEPD">
			<title>IEPD Conformance Targets</title>

			<p>This specification establishes three primary <termRef
					term="information exchange package documentation">IEPD</termRef>
				<termRef term="conformance target">conformance targets</termRef>:
					<termRef>information exchange package documentation</termRef>,
					<termRef>information exchange package</termRef> and
				<termRef>artifact</termRef>.</p>

			<!-- ###################### CT IEPD CT ####################### -->


			<section id="CT-IEPD-CT"><title>Information Exchange Package Documentation</title>

				<definition term="information exchange package documentation">
					<p>An <termRef>information exchange package documentation</termRef> is a set of
						<termRef term="artifact">artifacts</termRef> (possibly in a ZIP file)
						that:</p>
					
					<ul>
						<li>
							<p>includes a set of logically cohesive W3C XML Schema documents and
								other supporting files, that represent one or more reusable or
								implementable XML information models, and</p>
						</li>
						<li>
							<p>has an IEPD <termRef>conformance target identifier</termRef>
								<code>MACRO_IEPD_conformance_target_identifier</code>, and</p>
						</li>
						<li>
							<p>conforms to all the rules in this specification for the conformance
								target <termRef>information exchange package documentation</termRef>
								(i.e., applicability code <q>IEPD</q>), and</p>
						</li>
						<li>
							<p>is well-formed (conforms to all the rules with applicability code
								<q>WF-IEPD</q>).</p>
						</li>
					</ul>
					<p>This term may be abbreviated <q>IEPD</q>. Rules specifying this conformance
						target use the applicability code <q>IEPD</q>.</p>
				</definition>
				
				<p>An <termRef term="information exchange package documentation">IEPD</termRef> has
					one or more <qName>c:IEPConformanceTarget</qName> elements within its
					<termRef>IEPD catalog document</termRef>, each defining a class of <termRef
						term="information exchange package">information exchange packages</termRef>
					(IEP), in which each <termRef term="information exchange package">IEP</termRef>
					is an <termRef term="instance XML document">instance XML document</termRef>.</p>
				
				<definition term="instance XML document">
					<p>An <termRef>instance XML document</termRef> is an <termRef>XML
						document</termRef> that is valid against an <termRef>XML
							Schema</termRef>. An <termRef>instance XML document</termRef> is said to
						be an instance of the schema to which it validates.</p>
				</definition>
				
				<p>An IEPD also defines one or more data exchanges, one per <termRef>conformance
					target</termRef>. Each data exchange occurs at runtime in the form of an
					<termRef>instance XML document</termRef>, which is an <termRef
						term="information exchange package">IEP</termRef> that conforms to the rules
					defined in the <qName>c:IEPConformanceTarget</qName> element.</p>
				
				<p>An <termRef term="information exchange package documentation">IEPD</termRef>
					contains a NIEM-conformant XML schema document set that may include portions of
					a NIEM core schema document (and supplements), portions of NIEM Domain schema
					documents (and updates), and enterprise-specific or IEPD-specific <termRef
						term="extension schema document">extension schema documents</termRef>. The
					<termRef term="XML schema document">XML schema documents</termRef> contained
					in an <termRef term="information exchange package documentation">IEPD</termRef>
					work together to define one or more classes of <termRef
						term="instance XML document">instance XML documents</termRef> that
					consistently encapsulate data for meaningful information exchanges. Any
					<termRef>instance XML document</termRef> that is valid for the <termRef>XML
						schema document</termRef> set and that satisfies the conditions of the
					<termRef>IEP conformance target</termRef> is a member of that <termRef>IEP
						conformance target</termRef> class (or IEP Class).</p>
				
				<p><termRef term="XML schema document">XML schema documents</termRef> in an <termRef
					term="information exchange package documentation">IEPD</termRef> conform to
					the <ref idref="NIEM-NDR"/> and may use or extend data component definitions
					drawn from NIEM. An <termRef term="information exchange package documentation"
						>IEPD</termRef> may also incorporate and use XML schema documents from other
					standards that do not conform to NIEM. (See the current <ref idref="NIEM-NDR"/> for
					details.) An <termRef term="information exchange package documentation"
						>IEPD</termRef> consists of a set of artifacts (XML schema documents,
					documentation, sample instance XML documents, etc.) that together define and
					describe one or more implementable data exchanges. An <termRef
						term="information exchange package documentation">IEPD</termRef> should
					contain all materials necessary to:</p>
				<ul>
					<li>
						<p>Understand information exchange context, content, semantics, and
							structure.</p>
					</li>
					<li>
						<p>Create and validate XML documents defined by the <termRef
							term="information exchange package documentation">IEPD</termRef>,
							and used for information exchanges.</p>
					</li>
					<li>
						<p>Identify the lineage of the <termRef
							term="information exchange package documentation">IEPD</termRef>
							itself and optionally its artifacts.</p>
					</li>
				</ul>
				
				<p>(The terms <termRef>information exchange package</termRef> (IEP) and
					<termRef>information exchange package documentation</termRef> (IEPD) first
					appeared in <ref idref="FEA-DRM"/> and <ref idref="GJXDM-IEPD"/>,
					respectively.)</p>
				
				<p>The following rule applies to all IEPDs:</p>
				
				<ruleSection>
					<title>IEPD conformance target identifier</title>
					<rule id="r-ct-iepd" applicability="IEPD" class="Constraint">
						<p>An <termRef term="information exchange package documentation"
							>IEPD</termRef> MUST have an <termRef>IEPD conformance target
								identifier</termRef> of
							<code>MACRO_IEPD_conformance_target_identifier</code> as a value of
							its <qName>c:iepdConformanceTargetIdentifierURIList</qName>
							attribute.</p>
					</rule>
				</ruleSection>
				
				<p>How to declare validity constraints for one or more IEP classes within an
					<termRef term="information exchange package documentation">IEPD</termRef>
					will be covered in more depth in <ref
						idref="Defining-Information-Exchange-Packages"/>.</p>
				
				<p>Note that NIEM conformance does not require that an IEP be native XML on the
					transmission medium. A NIEM-conformant IEP may be encrypted, compressed (e.g.,
					using <ref idref="PKZIP"/>, <ref idref="W3-EXI"/>, etc.), or wrapped within an
					envelope mechanism, as long as its original native XML form can be retrieved by
					the receiver.</p>
				
				<p>Common to <termRef term="information exchange package documentation"
					>IEPDs</termRef>:</p>
				<ul>
					<li>
						<p>Requires a <code>readme</code> artifact.</p>
					</li>
					<li>
						<p>Its <termRef>XML schema document</termRef> set defines data exchanges
							(<termRef term="information exchange package">information exchange
								packages</termRef> or IEPs).</p>
					</li>
					<li>
						<p>Can contain subset, extension, external, or constraint schema
							documents.</p>
					</li>
					<li>
						<p>Must declare at least one or more <termRef term="IEP conformance target"
							>IEP conformance targets</termRef>.</p>
					</li>
					<li>
						<p>Contains sample instance XML documents that validate to each XML schema
							document set.</p>
					</li>
				</ul>
				
			<!-- ####################### CT Well-Formed IEPD CT ################### -->
			
			
			<section id="CT-WF-IEPD-CT"><title>Well-Formed IEPD</title>			
				
				<p>An <termRef term="information exchange package documentation">IEPD</termRef> may
					be constructed manually, but it is far more efficient to generate an IEPD
					entirely or in part using NIEM-aware software tools. The existence of an
						<termRef>information exchange package documentation</termRef>
					<termRef>conformance target</termRef> has several advantages:</p>

				<ul>
					<li>
						<p>Facilitates the existence of many incremental states from start to finish
							that are checkpoints for well-formedness.</p>
					</li>
					<li>
						<p>Enables multiple paths to completion; no single pre-determined sequence
							of rule applications is required.</p>
					</li>
					<li>
						<p>Provides tool developers with the flexibility to construct an <termRef
								term="information exchange package documentation">IEPD</termRef>
							incrementally in many different sequences.</p>
					</li>
					<li>
						<p>Avoids a need to build a complete <termRef
								term="information exchange package documentation">IEPD</termRef>
							before automated correctness checks can be applied (since
							well-formedness can be checked at many stages of development).</p>
					</li>
					<li>
						<p>Facilitates the interoperability and use of multiple tools that can
							export/import an <termRef>information exchange package
								documentation</termRef>.</p>
					</li>
				</ul>

				<p>Because an IEPD is always a directory tree, for the purpose of transporting,
					up/downloading, and archiving for long term storage, an IEPD is packaged as a
						<termRef>ZIP file</termRef>.</p>
				
				<definition term="ZIP file">
					<p>As defined by <ref idref="PKZIP"/>, which states that it defines:</p>
					<blockquote>
						<p>... a cross-platform, interoperable file storage and transfer format ...
							used to aggregate, compress, and encrypt files into a single
							interoperable container.</p>
					</blockquote>
				</definition>
				
				<p>All IEPDs share several commonalities; each IEPD:</p>
				<ul>
					<li>
						<p>Is a set of <termRef term="artifact">artifacts</termRef>, whose principal
							content is <termRef term="XML schema document">XML schema
								documents</termRef> (XSD), the purpose for which is to define the
							exchanges themselves.</p>
					</li>
					<li>
						<p>Requires a self-documenting <code>iepd-catalog.xml</code> artifact
							containing metadata and a listing of its key artifacts. This artifact
							establishes identification metadata, <termRef term="conformance target"
								>conformance targets</termRef>, purpose, general content, lineage,
							and other metadata.</p>
					</li>
					<li>
						<p>Requires the following metadata:</p>
						<ul>
							<li>
								<p>Uniform Resource Identifier (URI) (See <ref idref="iepdURI"
									/>)</p>
							</li>
							<li>
								<p>Name (See <ref idref="Name-Syntax"/>)</p>
							</li>
							<li>
								<p>Version number (See <ref idref="Version-Numbering-Scheme"/>)</p>
							</li>
							<li>
								<p>The <termRef>conformance target identifier</termRef>
									<code>MACRO_IEPD_conformance_target_identifier</code> (See <ref
										idref="iepdConformanceTargetIdentifier"/>)</p>
							</li>
						</ul>
					</li>
					<li>
						<p>Contains a copy of (not just URLs or references to) all schema documents
							needed to validate any <termRef>instance XML document</termRef> class it
							defines.</p>
					</li>
					<li>
						<p>May contain optional alternate representations in addition to XML Schema
							(e.g., generic diagram, UML/XMI, database format, spreadsheet,
							etc.).</p>
					</li>
					<li>
						<p>May contain miscellaneous other documentation or file artifacts for
							assisting with usage or implementation.</p>
					</li>
				</ul>

				<definition term="well-formed IEPD">
					<p>A <termRef>well-formed IEPD</termRef> is an <termRef term="information exchange package documentation">IEPD</termRef> that:</p>
          <ul>
           
	    <!--<li><p>has an <termRef>IEPD conformance target identifier</termRef> of <code>MACRO_IEPD_conformance_target_identifier</code>, and</p></li>-->
        <li><p>has an <termRef>IEPD conformance target identifier</termRef> of <code>MACRO_WF_IEPD</code>, and</p></li>
        <li><p>adheres to all the rules within this specification for the <termRef>well-formed IEPD</termRef> <termRef>conformance target</termRef> (i.e., applicability code <q>WF-IEPD</q>).</p></li>
          </ul>
	  <p>This term may be abbreviated <q>WF-IEPD</q>. Rules specifying this conformance target use the applicability code <q>WF-IEPD</q>.</p>
	</definition>

				<p>A <termRef>well-formed IEPD</termRef> satisfies the need for a set of <termRef term="artifact">artifacts</termRef> (or a <termRef>ZIP file</termRef>) with an <termRef>IEPD catalog document</termRef> that validates to the IEPD catalog schema, and contains no broken links to local artifacts it references.  This definition enables a developer to build an <termRef term="information exchange package documentation">IEPD</termRef> by iteratively adding artifacts and expanding the IEPD catalog to reference them.</p>

				<p>Most rules in this <termRef term="information exchange package documentation">IEPD</termRef> specification are applicable to a <termRef>well-formed IEPD</termRef> <termRef>conformance target</termRef>.  Rules for this conformance target are less concerned with the correct use of NIEM and completeness, and more concerned with proper format, proper structure (e.g., link integrity), and correct use of artifacts.  Adherence to these rules can produce an <termRef term="information exchange package documentation">IEPD</termRef> that is well-formed (WF-IEPD), but that does not necessarily satisfy all general and specific requirements for an <termRef term="information exchange package documentation">IEPD</termRef>.  The following rule ensures that a complete <termRef term="information exchange package documentation">IEPD</termRef> adheres to all applicable NIEM conformance rules.</p>
				
				<ruleSection>
		<title>IEPD is well-formed</title>
		<rule id="r-ct-wf-iepd" applicability="WF-IEPD" class="Constraint">
			<!--<p>An <termRef term="information exchange package documentation">IEPD</termRef> MUST have an <termRef>IEPD conformance target identifier</termRef> of <code>MACRO_IEPD_conformance_target_identifier</code>.</p>-->
			<p>An <termRef term="information exchange package documentation">IEPD</termRef> MUST have an <termRef>IEPD conformance target identifier</termRef> of <code>MACRO_WF_IEPD</code>.</p>
		</rule>
	</ruleSection>
				
				<p>The schemas and other files within an <termRef>information exchange package
						documentation</termRef> are built on other specifications, including:</p>

				<ul>
					<li>
						<p>
							<ref idref="NIEM-NDR"/>
						</p>
					</li>
					<li>
						<p>
							<ref idref="NIEM-CTAS"/>
						</p>
					</li>
					<li>
						<p>
							<ref idref="NIEM-Conformance"/>
						</p>
					</li>
				</ul>

</section>
</section>

			<!-- ##################### CT IEP ###################### -->


			<section id="CT-IEP">
				<title>IEP Conformance Targets</title>

				<p>In NIEM, an information exchange instance is an <termRef>information exchange
						package</termRef> (IEP). An IEP is also a <termRef>conformance
						target</termRef> and in that connotation is defined as follows:</p>

				<definition term="information exchange package">
					<p>An <termRef>instance XML document</termRef> that conforms to the
						conformance target defined by a <qName>c:IEPConformanceTarget</qName>
						element in the <termRef>IEPD catalog document</termRef> of an
							<termRef>information exchange package documentation</termRef>.</p>
					<p>This term may be abbreviated <q>IEP</q>. Rules specifying this conformance
						target use the applicability code <q>IEP</q>.</p>
				</definition>

				<p>The definition of an <termRef>information exchange package</termRef> conformance
					target does not ensure that an <termRef term="information exchange package"
						>IEP</termRef> uses NIEM-defined elements for its information content. That
					is the function of the <termRef term="full NIEM information exchange package"
						>full NIEM IEP</termRef>
					<termRef>conformance target</termRef>, defined as follows:</p>

				<definition term="full NIEM information exchange package">
					<p>An <termRef>information exchange package</termRef> that satisfies all the
						validity constraints for its class as defined by an <termRef>information
							exchange package documentation</termRef>, and that has an XML document
						element that is declared in either a NIEM reference or extension schema
						document.</p>
					<p>This term may be abbreviated <q>full NIEM IEP</q>. Rules specifying this
						conformance target use the applicability code <q>FN-IEP</q>.</p>
				</definition>

			</section>

			<section id="CT-Artifact">
				<title>Artifact Conformance Targets</title>

				<p>Conformance targets that correspond to artifacts internal to an <termRef
						term="information exchange package documentation">IEPD</termRef>
					include:</p>
				<ul>
					<li>
						<p><termRef>schema document subset</termRef> (rule applicability code:
							Schema-subset)</p>
					</li>
					<li>
						<p><termRef>IEPD catalog document</termRef> (rule applicability code:
							IEPD-catalog)</p>
					</li>
					<li>
						<p><termRef>XML catalog document</termRef> (rule applicability code:
							XML-catalog)</p>
					</li>
				</ul>

			</section>
		</section>


		<!-- ################## CT App Codes ################## -->


		<section id="CT-Codes">
			<title>Rule Applicability Codes for Conformance Targets</title>

			<p>The table below lists the codes that represent standard <termRef
					term="conformance target">conformance targets</termRef> used in this
				specification and that appear in the applicability attribute for each rule.</p>

			<table id="ct-codes">
				<title>Rule Applicability Codes</title>
				<theadr>
					<th>Conformance Target</th>
					<th>Rule Applicability Code</th>
				</theadr>
				<tr>
					<td>
						<termRef>information exchange package documentation</termRef>
					</td>
					<td>
						<conformance-target id="IEPD">IEPD</conformance-target>
					</td>
				</tr>
				<tr>
					<td>
						<termRef>well-formed IEPD</termRef>
					</td>
					<td>
						<conformance-target id="WF-IEPD">WF-IEPD</conformance-target>
					</td>
				</tr>
				<tr>
					<td>
						<termRef>information exchange package</termRef>
					</td>
					<td>
						<conformance-target id="IEP">IEP</conformance-target>
					</td>
				</tr>
				<tr>
					<td>
						<termRef term="full NIEM information exchange package">full NIEM
							IEP</termRef>
					</td>
					<td>FN-IEP</td>
				</tr>
				<tr>
					<td>
						<termRef>schema document subset</termRef>
					</td>
					<td>
						<conformance-target id="Schema-subset">Schema-subset</conformance-target>
					</td>
				</tr>
				<tr>
					<td>
						<termRef>IEPD catalog document</termRef>
					</td>
					<td>
						<conformance-target id="IEPD-catalog">IEPD-catalog</conformance-target>
					</td>
				</tr>
				<tr>
					<td>
						<termRef>XML catalog document</termRef>
					</td>
					<td>
						<conformance-target id="XML-catalog">XML-catalog</conformance-target>
					</td>
				</tr>
			</table>

		</section>
	</section>


	<!-- ####################### IEPD XML Schema Document Artifacts ########################### -->


	<section id="IEPD-XML-Schema-Artifacts">
		<title>IEPD XML Schema Document Artifacts</title>

		<p><termRef>XML schema document</termRef> artifacts are the essential content of IEPDs
			because they normatively define and declare <termRef term="data component">data
				components</termRef>. The purpose of an <termRef
				term="information exchange package documentation">IEPD</termRef> is determined by
			the <termRef>XML schema document</termRef> or document set(s) it contains; furthermore,
			each <termRef> XML schema document</termRef> may have a different purpose. The <ref
				idref="NIEM-NDR"/> addresses some schema documents as <termRef
				term="conformance target">conformance targets</termRef> including reference schema
			documents, extension schema documents, and schema document sets. Each conformance target
			may adhere to a different (though possibly overlapping) set of conformance rules.
			Consult the current <ref idref="NIEM-NDR"/> for these rules. NIEM also employs a special
			technique that relies on <termRef term="constraint schema document set">constraint
				schema document sets</termRef> (See <ref idref="Constraint-Schemas"/>).</p>

		<p>The following subsections define each type of NIEM schema document and document set.</p>


		<section id="Reference-Schemas">
			<title>Reference Schema Documents</title>

			<p>Though not common, it is valid to use a <termRef>reference schema document</termRef>
				or document set within an <termRef term="information exchange package documentation"
					>IEPD</termRef>. The <termRef>reference schema document</termRef> and
					<termRef>reference schema document set</termRef> were defined earlier in <ref
					idref="Reference-Schema-Document"/>.</p>

		</section>

		<section id="Subset-Schemas">
			<title>Subset Document Schemas</title>

			<section id="Basic-Subset-Concepts">
				<title>Basic Subset Concepts</title>

				<p>A NIEM <em>schema document subset</em> is a set of XML schema documents that
					constitutes a reduced set of components derived from a NIEM reference schema
					document or document set associated with a given numbered release or domain update.</p>

				<definition term="schema document subset">
					<p>An XML schema document set based on a reference schema document set for which any <termRef>instance XML document</termRef> valid to the
						schema document subset is also valid to the reference schema document
						set.</p>
				</definition>

				<p>The primary purpose for a schema document subset is to reduce and constrain the
					scope and size of a full NIEM reference schema document set for use within an
						<termRef term="information exchange package documentation">IEPD</termRef>. A
					schema document subset is derived from a reference schema document set (such as
					a NIEM release) by applying subset operations (See <ref
						idref="Constructing-Subsets"/>). Also, note that employing a subset of a
					reference schema document set within an <termRef
						term="information exchange package documentation">IEPD</termRef> is
					optional; it is completely valid to reuse NIEM reference schema documents as-is
					within IEPDs.</p>

				<p>The fundamental rule for a valid NIEM schema document subset is formally stated
					follows:</p>

				<ruleSection>
					<title>Fundamental NIEM Subset Rule</title>
					<rule id="r-subset" applicability="Schema-subset" class="Constraint">
						<p>A schema document subset (<code>$SUBSET</code>) for a given reference
							schema document set (<code>$REFERENCE</code>) MUST be defined such that
							for all instance XML documents (<code>$XML</code>), where
								<code>$XML</code> is valid to <code>$SUBSET</code>,
								<code>$XML</code> is valid to <code>$REFERENCE</code>.</p>
					</rule>
				</ruleSection>

				<p>A <termRef>schema document subset</termRef> is composed of <termRef
						term="XML schema document">XML schema documents</termRef>. A <termRef>schema
						document subset</termRef> can essentially be a <termRef>reference schema
						document set</termRef> (i.e., a NIEM release) that has been modified by
					applying subset operations to support business requirements represented in an
						<termRef term="information exchange package documentation">IEPD</termRef>. A
					subset derived from a reference schema document set may differ from that
					reference such that its content has been reduced and/or constrained.</p>

				<definition term="subset schema document">
					<p>An XML schema document that meets all of the following criteria:</p>
					<ul>
						<li>
							<p>It is built from a reference schema document set where one or more
								reference schema documents have been substituted by corresponding
								subset schema documents.</p>
						</li>
						<li>
							<p>It is built from a reference schema document by applying subset
								operations to the XML schema statements in a reference schema
								document.</p>
						</li>
						<li>
							<p>It is explicitly designated as a subset schema document. This is
								accomplished by declaration in the relevant IEPD catalog or by a
								tool-specific mechanism outside the subset schema document.</p>
						</li>
						<li>
							<p>It has a target namespace previously defined by a reference schema
								document. That is, it does not provide original definitions and
								declarations for schema components, but instead provides an
								alternate schema representation of components that are defined by a
								reference schema document.</p>
						</li>
						<li>
							<p>It does not alter the business semantics of components in its
								namespace. The reference schema document defines these business
								semantics.</p>
						</li>
						<li>
							<p>It is intended to express the limited vocabulary necessary for an
									<termRef term="information exchange package documentation"
									>IEPD</termRef> and to support XML Schema validation for an
									<termRef term="information exchange package documentation"
									>IEPD</termRef>.</p>
						</li>
					</ul>
				</definition>

			</section>



			<section id="Constructing-Subsets">
				<title>Constructing a Schema Document Subset</title>

				<p>This section is non-normative. Use the subset operations in this section with
					caution.</p>

				<p>NIEM subset operations are essentially reduction operations that remove or
					constrain portions of a reference schema document set, thereby building a
					profile of the set. They do not expand the scope (i.e., relax constraints) or
					change the semantics of reference schema document set content.</p>

				<p>Because NIEM adopts an optional and over-inclusive data representation strategy,
					most elements in a NIEM reference schema have zero to unbounded cardinality. So,
					elements with cardinality <code>minOccurs="0"</code> are optional and may be
					omitted from a subset schema document if not needed for business reasons. It is
					also valid to constrain element cardinality within a subset schema document, as
					long as doing so does not break the subset relationship with the reference
					schema document set. For example, a reference schema document element with
					cardinality (<code>minOccurs="0"</code>, <code>maxOccurs="unbounded"</code>) may
					be constrained to (<code>0</code>,<code>1</code>) or
						(<code>1</code>,<code>1</code>) in a subset schema document. However, if a
					reference schema document element<char name="rsquo"/>s cardinality is
						(<code>1</code>,<code>unbounded</code>), it may not be constrained to
						(<code>0</code>,<code>1</code>) since this breaks the subset relationship.
					The interval (<code>0</code>,<code>1</code>) is not contained within, and
					instead, overlaps the interval (<code>1</code>,<code>unbounded</code>).</p>

				<p>The following list describes valid subset operations that are considered
					non-normative and informative only. In most cases, they can be applied to a
					schema document set and result in a corresponding <termRef>schema document
						subset</termRef>. However, it is possible to apply them in combinations that
					will break the subset relationship, or even result in invalid schemas. Apply
					these operations carefully and thoughtfully!</p>
				<ol>
					<li>
						<p>Remove an XML comment.</p>
					</li>
					<li>
						<p>Remove an <qName>xs:annotation</qName> and its children
								<qName>xs:documentation</qName> and <qName>xs:appinfo</qName>.</p>
					</li>
					<li>
						<p>Increase the value of an <code>xs:element/@minOccurs</code> as long as it
							remains less than or equal to its corresponding <code>@maxOccurs</code>
							value).</p>
					</li>
					<li>
						<p>Decrease the value of an <code>xs:element/@maxOccurs</code> as long as it
							remains greater than or equal to its corresponding
								<code>@minOccurs</code> value.</p>
					</li>
					<li>
						<p>Remove an <qName>xs:element</qName> if its
							<code>@minOccurs="0"</code>.</p>
					</li>
					<li>
						<p>Remove an <qName>xs:complexType</qName> or <qName>xs:simpleType</qName>
							if not supporting an <qName>xs:element</qName> or
								<qName>xs:attribute</qName> declaration, or another
								<qName>xs:complexType</qName> or <qName>xs:simpleType</qName>
							definition.</p>
					</li>
					<li>
						<p>Remove an <qName>xs:attribute</qName> with <code>@use="optional"</code>
							from an <qName>xs:complexType</qName>.</p>
					</li>
					<li>
						<p>Change an <code>xs:attribute/@use="optional"</code> to
								<code>@use="prohibited"</code>.</p>
					</li>
					<li>
						<p>Change an <code>xs:attribute/@use="optional"</code> to
								<code>@use="required"</code>.</p>
					</li>
					<li>
						<p>Remove an <qName>xs:element</qName> declaration if it is not supporting
							an element use.</p>
					</li>
					<li>
						<p>Remove an <qName>xs:enumeration</qName> from an
								<qName>xs:simpleType</qName> as long as it is not the only remaining
								<qName>xs:enumeration</qName>.</p>
					</li>
					<li>
						<p>Remove an element with representation term <code>AugmentationPoint</code>
							if it is not being used for element substitution.</p>
					</li>
					<li>
						<p>Add or apply a constraining facet to an <qName>xs:simpleType</qName>.</p>
					</li>
					<li>
						<p>Remove an <qName>xs:import</qName> and its associated schema document if
							the schema document is not used within the document set.</p>
					</li>
					<li>
						<p>Change a concrete <qName>xs:element</qName> declaration to
								<code>@abstract="true"</code>.</p>
					</li>
					<li>
						<p>Change an <code>xs:element/@nillable="true"</code> to
								<code>@nillable="false"</code>.</p>
					</li>
					<li>
						<p>Substitute an <code>xs:element/@substitutionGroup</code> member for its
							associated substitution group head.</p>
					</li>
					<li>
						<p>Substitute a composition of <code>xs:element/@substitutionGroup</code>
							members for their associated substitution head (subject to cardinality
							and unique particle attribution (UPA) constraints <ref
								idref="W3-XML-Schema-Structures"/>, <a
								href="http://www.w3.org/TR/2004/REC-xmlschema-1-20041028/#cos-nonambig">
								<char name="sect"/>
								<q>Schema Component Constraint: Unique Particle
							Attribution</q></a>). The composition is an ordered sequence of the
								<code>@substitutionGroup</code> member elements. Each substitute
							element may bound its cardinality such that the total cardinality sum is
							within the bounds of the <code>@substitutionGroup</code> head
							cardinality. Order and cardinality of the replacement sequence must
							conform to XML Schema UPA constraints.</p>
					</li>
					<li>
						<p>Replace a wildcard (subject to cardinality, UPA, and namespace
							constraints) with a composition, i.e., an ordered sequence of elements.
							Each element may further bound cardinality within the bounds of the
							wildcard. Order and cardinality of replacement sequence must conform to
							XML Schema UPA constraints. The namespace of each element must conform
							with namespace constraints specified by the wildcard (if any).</p>
					</li>
				</ol>

			</section>
		</section>


		<section id="Extension-Schemas">
			<title>Extension Schema Documents</title>

			<definition term="extension schema document">
				<p>As defined by <ref idref="NIEM-NDR"/>:</p>
				<blockquote>
					<p>An <termRef>XML schema document</termRef> that is intended to provide
						definitions of <termRef term="schema component">schema components</termRef>
						that are intended for reuse within a more narrow scope than those defined by
						a <termRef>reference schema document</termRef>.</p>
				</blockquote>
			</definition>

			<p>In general, an <termRef>extension schema document</termRef> contains components that
				use or are derived from the components in reference schema documents. It is intended
				to express additional vocabulary above and beyond the vocabulary available from
				reference schema documents.</p>

			<p>A developer who determines that NIEM is missing elements required for a given
				information exchange has several options for providing the missing elements. Using
				rules and techniques defined in the <ref idref="NIEM-NDR"/>:</p>
			<ul>
				<li>
					<p>Extend an existing NIEM <termRef>data component</termRef> (if possible).</p>
				</li>
				<li>
					<p>Augment an existing NIEM data type (through NIEM Type Augmentation).</p>
				</li>
				<li>
					<p>Build a new NIEM-conformant data component.</p>
				</li>
				<li>
					<p>Employ NIEM adapter types for components from an external standard that does
						not conform to NIEM.</p>
				</li>
			</ul>

			<p>A NIEM extension schema document may contain <termRef term="data component">data
					components</termRef> built from any of the options above. Employment of
				extension schema documents in an <termRef
					term="information exchange package documentation">IEPD</termRef> is entirely
				optional.</p>

			<p>Multiple extension schema documents are allowed in a single <termRef
					term="information exchange package documentation">IEPD</termRef>. Developers
				will likely want to reuse many of their extension schema documents in other IEPDs.
				Therefore, the best practice for extension is to group all <termRef
					term="data component">data components</termRef> designed to be reused into one
				extension schema document or document set, and group IEPD-specific <termRef
					term="data component">data components</termRef> into another. Then the reusable
				extension components can be more easily redeployed in other IEPDs as needed.</p>

			<p>Extension schema documents generally contain new <termRef>data component</termRef>
				declarations that may (though not necessarily) be derived from or reference existing
				NIEM <termRef term="data component">data components</termRef>. This being the case,
				reference schema documents do not exist for new <termRef term="data component">data
					components</termRef> found within extension schema documents. Therefore,
				extension schema documents must satisfy the more rigorous documentation requirements
				of reference schema documents. Per the <ref idref="NIEM-NDR"/>, the definition or
				declaration of each new <termRef>data component</termRef> in an extension schema
				document must include an <qName>xs:annotation</qName> element that provides its
				semantics and NIEM-specific relationships.</p>

		</section>



		<section id="External-Schemas">
			<title>External Schema Documents</title>

			<definition term="external schema document">
				<p>As defined by <ref idref="NIEM-NDR"/>:</p>
				<blockquote>
					<p>Any <termRef>XML schema document</termRef> that is not one of:</p>
					<ul>
						<li>
							<p>a <termRef>reference schema document</termRef>,</p>
						</li>
						<li>
							<p>an <termRef>extension schema document</termRef>, or</p>
						</li>
						<li>
							<p>an <termRef>XML schema document</termRef> that has the
									<code>structures</code> namespace as its target namespace.</p>
						</li>
					</ul>
				</blockquote>
			</definition>

			<p>An <termRef term="information exchange package documentation">IEPD</termRef> may
				contain <em>external schema documents</em> that do not conform to NIEM. Data
				components declared and defined in external schema documents require NIEM
					<em>external adapter types</em> to identify the fact they do not conform to
				NIEM.</p>

			<definition term="external adapter type">
				<p>As defined by <ref idref="NIEM-NDR"/>:</p>
				<blockquote>
					<p>A NIEM-conformant type that adapts external components for use within NIEM.
						An external adapter type creates a new class of object that embodies a
						single concept composed of external components. External adapter types are
						defined in NIEM-conformant schemas.</p>
				</blockquote>
			</definition>

			<p>Refer to the current <ref idref="NIEM-NDR"/> for details about external schema documents,
				external adapter types, and the rules defining their use.</p>

		</section>



		<section id="Constraint-Schemas">
			<title>Constraint Schema Document Sets</title>

			<definition term="constraint schema document set">
				<p>A set of related constraint schema documents that work together; for example, a
					constraint schema document set could be built by adding constraints to a schema
					document subset.</p>
			</definition>

			<p>A <termRef>constraint schema document set</termRef> is an <termRef>XML schema
					document</termRef> set that is used to express business rules for a class of
					<termRef term="instance XML document">instance XML documents</termRef>; it is
				not intended to provide definitions for the semantics of the individual components
				it contains. Instead, a constraint schema document set uses the XML Schema
				Definition Language to add constraints to components defined or declared by other
				schema documents, usually a <termRef>schema document subset</termRef>; but they can
				be applied to <termRef term="extension schema document">extension schema
					documents</termRef> as well.</p>

			<p>A <termRef>constraint schema document set</termRef> validates additional constraints
				imposed on an <termRef>instance XML document</termRef> only after it is known to be
				NIEM-conformant (i.e., has been validated with a <termRef>reference schema document
					set</termRef>, or <termRef>schema document subset</termRef>, and applicable
					<termRef term="extension schema document">extension schema
				documents</termRef>).</p>

			<p>To use a <termRef>constraint schema document set</termRef> to tighten constraints on
				an IEP, a two-pass validation technique is employed. In the first pass, an IEP is
				validated against the schema document subset and extension schema documents. This
				pass ensures that IEP semantics and structure conform to the NIEM model and <ref
					idref="NIEM-NDR"/>. In the second pass, an IEP is checked against a constraint
				schema document set, which may contain constrained versions of the <termRef
					term="subset schema document">subset schema documents</termRef> and <termRef
					term="extension schema document">extension schema documents</termRef>. This pass
				ensures that the IEP also satisfies the additional constraints (i.e., business rules
				that the first pass was unable to validate). A constraint schema document set need
				not validate constraints that are applied by other schema documents.</p>

			<p>Constraint schema document sets are generally useful when it is necessary to impose
				restrictions that are more complex than cardinality. If only cardinality
				restrictions are needed, then it is easier and more efficient to set these directly
				in the subset schema documents and avoid the use of a constraint schema document
				set. Otherwise, a constraint schema document set may be necessary.</p>

			<p>Use of a constraint schema document set is one option for tightening constraints on
				NIEM IEPs beyond what NIEM itself provides. This particular technique uses the XML
				Schema Definition Language <ref idref="W3-XML-Schema-Datatypes"/>, <ref
					idref="W3-XML-Schema-Structures"/>. NIEM also allows other methods that do not
				use XML Schema. For example, the use of <ref idref="ISO-Schematron"/> is the
				preferred method for applying business rules. However, other constraint or business
				rule methods are also acceptable. That said, at this time there are no normative
				rules for how these business rule techniques should be employed in NIEM IEPDs.
				Therefore, if other techniques are used, it is a developer responsibility to
				incorporate appropriate artifacts and clear documentation.</p>

			<p>Note that one disadvantage to use of constraint schema document sets is that they do
				not provide clear visibility or explanation of the constraints they enforce; nor do
				they provide clear validation failure messages. On the other hand, a standard
				business rule language such as <ref idref="ISO-Schematron"/> provides facilities for
				better understanding of the business rules, their intent, and error handling of
				failures.</p>

			<p>A common practice for creating an <termRef
					term="information exchange package documentation">IEPD</termRef> constraint
				schema document set is to start with a valid NIEM schema document subset and modify
				it to further restrict the class of instance XML documents (IEPs) that will validate
				with this constraint schema set. However, an extension schema document can also be
				used to derive a constraint schema document. Using this technique, the namespace of
				that schema document would reuse the target namespace of the schema document from
				which it is derived.</p>

			<p>There is no restriction on the number of constraint schema document sets (and
				validation passes) that an <termRef
					term="information exchange package documentation">IEPD</termRef> can employ. As
				in other advanced situations, developers must clearly document their intentions for
				and use of multiple constraint schema document sets.</p>

			<p>In general, constraint schema documents in a <termRef>constraint schema document
					set</termRef> have far fewer requirements than other classes of NIEM schema
				documents. Since they work in tandem with NIEM normative schema documents, these
				schema documents are allowed to use the XML Schema Definition language in any way
				necessary to express business rules. This means that to constrain instance XML
				documents, these schema document can employ XML Schema constructs that are not
				allowed in NIEM conformant schema documents.</p>

		</section>
	</section>


	<!-- ########################### IEPD Documentation Artifacts ############################ -->


	<section id="IEPD-Documentation-Artifacts">
		<title>IEPD Documentation Artifacts</title>

		<p>XML schema documents (and the schemas that result from them) are the essence of a NIEM
				<termRef term="information exchange package documentation">IEPD</termRef>. However,
			a variety of documentation files may be incorporated into a NIEM <termRef
				term="information exchange package documentation">IEPD</termRef>. One particular
			documentation file is required in every IEPD: <code>iepd-catalog.xml</code>, the IEPD
			catalog document. This file contains basic metadata, relationship and lineage data,
				<termRef>conformance target</termRef> specifications, and validation
			information.</p>

		<p>A <termRef>readme artifact</termRef> (formerly known as a <em>master document</em>) is
			mandatory for IEPDs. IEPDs are often built by different developers, and may be
			registered into a repository for reuse by many other users, developers, and
			implementers; therefore, a minimal form of documentation is absolutely necessary. An
				<termRef term="information exchange package documentation">IEPD</termRef> readme
			file is the primary source and starting point for human readable documentation, and
			should reference (and describe) any other separate documentation artifacts. This
			requirement ensures that baseline documentation is consistently rooted in a clearly
			visible artifact within each <termRef term="information exchange package documentation"
				>IEPD</termRef>.</p>

		<p>The following subsections address these documentation artifacts and the concepts,
			metadata, and content each supports.</p>



		<section id="IEPD-Catalog">
			<title>NIEM IEPD Catalog</title>

			<definition term="IEPD catalog document">
				<p>An <termRef>instance XML document</termRef> that:</p>
				<ul>
					<li>
						<p>conforms to all the rules in this specification for the conformance
							target <termRef>IEPD catalog document</termRef> (i.e., applicability
							code <q>IEPD-catalog</q>), and</p>
					</li>
					<li>
						<p>contains metadata describing:</p>
						<ul>
							<li>
								<p>IEPD unique identification</p>
							</li>
							<li>
								<p>
									<termRef term="conformance target">Conformance targets</termRef>
								</p>
							</li>
							<li>
								<p>Basic characteristics and properties</p>
							</li>
							<li>
								<p>Key artifacts and directory structure</p>
							</li>
							<li>
								<p>Relationships to other IEPDs and their artifacts</p>
							</li>
						</ul>
					</li>
				</ul>
				<p>This term may be abbreviated <q>IEPD-catalog</q>. Rules specifying this
					conformance target use the applicability code <q>IEPD-catalog</q>.</p>
			</definition>

			<p>Each <termRef term="information exchange package documentation">IEPD</termRef> may
				have somewhat different catalog requirements. The catalog metadata are formally
				defined by the XML Schema document in <ref idref="IEPD-Catalog-XSD"/>. IEPD catalog
				metadata are designed to be the minimal needed to facilitate human understanding,
				tool support, and machine processing. The metadata can support a number of <termRef
					term="information exchange package documentation">IEPD</termRef> uses and
				functions including (but not limited to):</p>
			<ul>
				<li>
					<p>Identification of key artifacts</p>
				</li>
				<li>
					<p>Generation of a hyperlinked content display using XSLT</p>
				</li>
				<li>
					<p>Browsing and understanding of artifacts and their content</p>
				</li>
				<li>
					<p>Automatic registration into a registry/repository</p>
				</li>
				<li>
					<p>Search, discovery, retrieval of IEPDs (through metadata and relationships)</p>
				</li>
				<li>
					<p>Reuse of IEPDs and their artifacts</p>
				</li>
				<li>
					<p>Tracing and analysis of IEPD lineage</p>
				</li>
				<li>
					<p>General conformance and validation of the <termRef
							term="information exchange package documentation">IEPD</termRef>
						itself</p>
				</li>
				<li>
					<p>Definition, identification, and validation of IEP conformance targets</p>
				</li>
			</ul>

			<ruleSection>
				<title>IEPD Has an <code>iepd-catalog.xml</code> in its Root Directory</title>
				<rule id="r-wf-iepd" applicability="WF-IEPD" class="Constraint">
					<p>Within its <termRef term="IEPD root directory">root directory</termRef>, an
							<termRef term="information exchange package documentation"
							>IEPD</termRef> MUST contain an <termRef>IEPD catalog document</termRef>
						artifact with name <code>iepd-catalog.xml</code>.</p>
				</rule>
			</ruleSection>

			<ruleSection>
				<title>IEPD Catalog Document Valid to
					<code>MACRO_IEPD_catalog_xsd_name</code></title>
				<rule id="r1-iepd-cat" applicability="IEPD-catalog" class="Constraint">
					<p>An <termRef>IEPD catalog document</termRef> MUST be valid to
							<code>MACRO_IEPD_catalog_xsd_name</code> as provided by <ref
							idref="IEPD-Catalog-XSD"/>.</p>
				</rule>
			</ruleSection>

			<p>This rule requires validation with <code>MACRO_IEPD_catalog_xsd_name</code>, which
				also imports a NIEM schema subset. So, validation of the <termRef>IEPD catalog
				document</termRef> must be done in the context of the catalog schema document,
				its associated NIEM subset, and <code>iepd-catalog.xml</code>. This does not require
				the <termRef term="information exchange package documentation">IEPD</termRef> to
				contain copies of the catalog schema document or the schema subset (since these are
				standard for all IEPDs). However, a validation tool must have access to all three
				XML documents.</p>

			<p>The XML schema documents required to validate an <termRef>IEPD catalog
				document</termRef> are available on the <ref idref="NIEM-Template-IEPD-Repository"/>. Note
				that validators often require references to schemas and their imports. This may be
				done through a command line instruction or by adding a <code>schemaLocation</code>
				attribute to <qName>xs:import</qName> statements. A sample <termRef>IEPD catalog document</termRef>, <ref idref="IEPD-Catalog-Document-CoT"/> is included in this specification.</p>

			<section id="IEPD-Catalog-TOC">
				<title>IEPD Catalog as a Table of Contents</title>

				<p>One function of the IEPD catalog is to serve as a table of contents that
					identifies, locates, and classifies key artifacts and artifact sets. For that
					purpose, <ref idref="IEPD-Catalog-XSD"/> provides a number of classifier
					elements for most common artifacts and artifact sets in IEPDs. For other less
					common or generic artifacts two general classifiers exist:
						<qName>c:Documentation</qName> and <qName>c:ApplicationInfo</qName>. These
					elements loosely correspond to the meaning of the XML Schema
						<qName>xs:annotation</qName> child elements, <qName>xs:documentation</qName>
					and <qName>xs:appinfo</qName>. General visual, audio, and textual explanatory
					documentation should be classified as <qName>c:Documentation</qName>, while
					tool-specific artifacts (such as imports, exports, executables, etc.) should be
					classified as <qName>c:ApplicationInfo</qName>.</p>

				<p>The classifier elements are designed to identify, categorize, and describe any
					artifacts and artifact sets (including its <termRef>path name</termRef>,
					dependencies, and lineage). Employing XSLT, <code>iepd-catalog.xml</code> can be
					transformed into an <code>index.html</code> artifact that displays a hyperlinked
					IEPD table of contents and metadata summary in a browser.</p>

				<p>A best practice is to use the <code>readme</code> artifact (i.e., the
						<termRef>readme artifact</termRef> required in the <termRef>IEPD root
						directory</termRef>) to reference <qName>c:Documentation</qName> and
						<qName>c:ApplicationInfo</qName> artifacts whether or not they have been
					classified in the IEPD catalog.</p>

				<p>An IEPD catalog is not required to record all IEPD artifacts. The <termRef
						term="information exchange package documentation">IEPD</termRef> author
					decides which artifacts (both files and sets) are important enough to explicitly
					include in the IEPD catalog. The author may choose to classify all, some, or
					none in the catalog.</p>

				<p>The IEPD catalog provides a supplement or an alternative to organizing <termRef
						term="information exchange package documentation">IEPD</termRef> artifacts
					and sets with a standard file directory. An author can use it to identify,
					classify, and describe particular artifacts or sets, instead of having to do so
					with only file names and directory structure. An author can also employ the
					guidance in <ref idref="Guidance-IEPD-Directories"/>.</p>

			</section>



			<section id="Extending-an-IEPD-Catalog">
				<title>Extending an IEPD Catalog</title>

				<p>An IEPD catalog may be extended to accommodate new or additional metadata,
					artifact classifiers, or validity constraints that are not already defined in
						<ref idref="IEPD-Catalog-XSD"/>.</p>

				<p>To extend the IEPD catalog, an <termRef
						term="information exchange package documentation">IEPD</termRef> author must
					provide both an XML catalog extension document (XML) and one or more IEPD
					extension schema documents (XSD). The XML catalog extension identifies that one
					or more IEPD catalog extensions are present, and resolves their namespaces to
					local URIs. The IEPD catalog extension is a schema that defines and declares the
					new <termRef term="data component">data components</termRef> for metadata,
					classifiers, and/or constraints. Both general <ref idref="NIEM-Conformance"/>
					and specific <ref idref="NIEM-NDR"/> conformance rules apply to these
					components. The XML catalog extension document must reside in the <termRef>IEPD
						root directory</termRef>. The IEPD extension schema documents may bear any
					file name and reside anywhere in the <termRef
						term="information exchange package documentation">IEPD</termRef>. This is
					because the XML catalog is expected to <termRef term="resolve URI"
						>resolve</termRef> all local URIs. IEPD processing tools are expected to
					look for and recognize the XML catalog (that identifies IEPD catalog extensions
					exist) by its file name.</p>

				<p>The following rules specify the requirements for an IEPD catalog extension XML
					catalog document:</p>

				<ruleSection>
					<title>IEPD Catalog Extension XML Catalog Document in Root Directory</title>
					<rule id="r1-iepd-cat-ext-xml-cat" applicability="IEPD-catalog"
						class="Constraint">
						<p>An IEPD catalog extension XML catalog document MUST reside in the same
							relative directory as the <code>iepd-catalog.xml</code> artifact
							(normally in the <termRef>IEPD root directory</termRef>)</p>
					</rule>
				</ruleSection>

				<ruleSection>
					<title>IEPD Catalog Extension XML Catalog Document Name Is
							<code>iepd-catalog-extension-xml-catalog.xml</code></title>
					<rule id="r2-iepd-cat-ext-xml-cat" applicability="IEPD-catalog"
						class="Constraint">
						<p>An IEPD catalog extension XML catalog document MUST bear the file name
							(and type) <code>iepd-catalog-extension-xml-catalog.xml</code>.</p>
					</rule>
				</ruleSection>

				<ruleSection>
					<title>IEPD Catalog Extension XML Catalog Document Resolves Namespaces to
						URIs</title>
					<rule id="r3-iepd-cat-ext-xml-cat" applicability="IEPD-catalog"
						class="Constraint">
						<p>An IEPD catalog extension XML catalog document MUST <termRef
								term="resolve URI">resolve</termRef> all IEPD catalog schema
							extension document namespaces to the correct corresponding local URIs in
							the IEPD.</p>
					</rule>
				</ruleSection>

				<p>So, when a processor identifies a file named
						<code>iepd-catalog-extension-xml-catalog.xml</code> in the <termRef>IEPD
						root directory</termRef>, it can assume that it contains references to one
					or more IEPD catalog extension schema documents that adhere to the following
					rules:</p>

				<ruleSection>
					<title>IEPD Catalog Extension Schema Document Conforms to NDR Extension Schema
						Document Rules</title>
					<rule id="r1-iepd-cat-ext-xsd" applicability="IEPD-catalog" class="Constraint">
						<p>An IEPD catalog extension schema document MUST conform to the <ref
								idref="NIEM-NDR"/> extension schema document conformance target
							rules.</p>
					</rule>
				</ruleSection>

				<ruleSection>
					<title>IEPD Catalog Schema and Its Extensions Conform to NDR Schema Set
						Rules</title>
					<rule id="r2-iepd-cat-ext-xsd" applicability="IEPD-catalog" class="Constraint">
						<p>Within an IEPD, the schema set formed by
								<code>MACRO_IEPD_catalog_xsd_name</code> and all IEPD catalog
							extension schema documents MUST conform to the <ref idref="NIEM-NDR"/>
							schema set conformance target rules.</p>
					</rule>
				</ruleSection>

				<p>Whether extending an IEPD catalog with new metadata elements, artifact classifier
					elements, or validity constraint elements, <ref idref="IEPD-Catalog-XSD"/>
					provides an abstract element as a substitution group head in each case. The user
					simply derives a new type (through extension or restriction), or reuses an
					existing type, then declares a new element (of that type), and identifies it
					with the appropriate substitution group. Whenever possible, the user should
					reuse types, elements, and attributes that are already defined/declared within
					the <ref idref="IEPD-Catalog-XSD"/>.</p>

				<p>If an IEPD catalog schema document extension uses NIEM <termRef
					term="data component">data components</termRef> that are not already
					contained in the NIEM Core subset provided on the <ref idref="NIEM-Template-IEPD-Repository"/>,
					then the additional components must be additive. In other words:</p>

				<ruleSection>
					<title>IEPD Schema Document Extension Support Schemas Are Supersets of Spec
						Subsets</title>
					<rule id="r3-iepd-cat-ext-xsd" applicability="IEPD-catalog" class="Constraint">
						<p>Subset schema documents provided to support an IEPD schema document
							extension MUST be a superset of the subset schema documents provided
							with this specification to support the IEPD catalog schema document.</p>
					</rule>
				</ruleSection>

			</section>
		</section>



		<section id="Metadata-Concepts">
			<title>Metadata Concepts</title>

			<p>The IEPD catalog also contains both required and optional metadata for the <termRef
					term="information exchange package documentation">IEPD</termRef> and its
				artifacts and artifact sets. The following subsections specify the syntax, formats,
				and semantics for that metadata.</p>



			<section id="Name-Syntax">
				<title>IEPD Name Syntax (<qName>c:iepdName</qName>)</title>

				<p>An IEPD<char name="rsquo"/>s official name is the value of the
						<qName>c:iepdName</qName> attribute owned by the <qName>c:IEPD</qName>
					element in the IEPD<char name="rsquo"/>s catalog document. This value is
					constrained by the regular expression pattern on <qName>c:iepdName</qName>
					within the IEPD catalog schema <ref idref="IEPD-Catalog-XSD"/>:</p>
				<blockquote>
					<p>
						<code>[A-Za-z]([-_ ]?[A-Za-z0-9]+)*</code>
					</p>
				</blockquote>

				<p>The regular expression above indicates that an IEPD name:</p>
				<ul>
					<li>
						<p>Begins with an alpha character (upper or lower case).</p>
					</li>
					<li>
						<p>Ends with an alphanumeric character (upper or lower case).</p>
					</li>
					<li>
						<p>May contain alphanumeric characters.</p>
					</li>
					<li>
						<p>May contain single spaces, single dashes, and single underscores as
							separators.</p>
					</li>
				</ul>

				<p><termRef term="information exchange package documentation">IEPD</termRef>
						author<char name="rsquo"/>s often reuse the official <termRef
						term="information exchange package documentation">IEPD</termRef> name in
					metadata within the file name. Note that <qName>c:iepdName</qName> is of
						<qName>xs:token</qName> type and allows single spaces and upper case alpha
					characters. That said, be sure to consider differences in operating system or
					file system treatment of spaces and character case within file and directory
					names. (See <ref idref="r-iepd-name-syntax"/>.</p>

				<p><qName>c:iepdName</qName> is not the same thing as the name of the file
					containing the IEPD, described in <ref idref="IEPD-File-Name-Syntax"/>.</p>

			</section>

			<section id="iepdConformanceTargetIdentifier">
				<title>IEPD Conformance Target Identifier
						(<qName>c:iepdConformanceTargetIdentifierURIList</qName>)</title>

				<p>An <termRef>IEPD conformance target identifier</termRef> is a
						<termRef>conformance target identifier</termRef> to which the given <termRef
						term="information exchange package documentation">IEPD</termRef> claims to
					conform. The IEPD catalog
						<qName>c:iepdConformanceTargetIdentifierURIList</qName> attribute declares a
					list of <termRef term="conformance target identifier">conformance target
						identifiers</termRef>, identifying the <termRef term="conformance target"
						>conformance targets</termRef> to which the IEPD claims to conform.</p>

				<p>The <qName>c:iepdConformanceTargetIdentifierURIList</qName> attribute is an XML
					list type that may declare that an IEPD conforms to multiple conformance
					targets. An IEPD developer can establish a new IEPD <termRef>conformance
						target</termRef> identifier in addition to those provided by this and other
					NIEM specifications. The identifier represents the new conformance target which
					should be associated with one or more rules or constraints to which an IEPD must
					conform if it is assigned that identifier.</p>

				<p>An <termRef term="information exchange package documentation">IEPD</termRef>
					authoring organization might use another classification system for its IEPDs.
					For example, the organization <em>ABC</em> might establish the
						<termRef>conformance target identifier</termRef>
					<code>http://example.org/niem-iepd/1.0/#abc-org</code> to indicate its IEPDs
					also conform to its own stricter set of <termRef
						term="information exchange package documentation">IEPD</termRef> conformance
					rules. Thus, an IEPD catalog document for its published IEPDs would contain the
						<qName>c:iepdConformanceTargetIdentifierURIList</qName> component shown in <ref idref="abc"/>
					indicating conformance to three <termRef term="conformance target">conformance
						targets</termRef>.</p>

				<figure id="abc">
					<title>IEPD catalog <qName>c:iepdConformanceTargetIdentifierURIList</qName>
						attribute for organization ABC.</title>
					<pre>c:iepdConformanceTargetIdentifierURIList=
 "MACRO_IEPD_conformance_target_identifier
  http://example.org/niem-iepd/1.0/#abc-org"</pre>
				</figure>

			</section>



			<section id="Version-Numbering-Scheme">
				<title>IEPD Version Numbering Scheme (<qName>c:iepdVersionID</qName>)</title>

				<p>Published IEPDs may be periodically revised and updated; therefore, versioning is
					required to clearly indicate changes have occurred. In order to maintain some
					consistency while allowing reasonable flexibility to authors, this specification
					establishes a simple version numbering scheme that is consistent with most
					common practices. This is the same version numbering scheme that is used for
					NIEM releases.</p>

				<p>An IEPD version number is the value of the <qName>c:iepdVersionID</qName>
					attribute owned by the <qName>c:IEPD</qName> element within its <termRef>IEPD
						catalog document</termRef>. A consistent version number syntax is enforced
					by the IEPD catalog schema in <ref idref="IEPD-Catalog-XSD"/>. The syntax rule
					is as follows:</p>

				<ruleSection>
					<title>IEPD Version Number Syntax</title>
					<rule id="r-iepd-vers-syntax" applicability="WF-IEPD" class="Constraint">
						<p>An IEPD MUST be assigned a version number that adheres to the regular
							expression:</p>
						<pre>	version ::= digit+ ('.' digit+)* (status digit+)?
	Where:	
		digit   ::= [0-9]
		status  ::= 'alpha' | 'beta' | 'rc' | 'rev'</pre>

						<p>The meaning of the <code>status</code> values are as follows:</p>
						<ul>
							<li>
								<p><code>alpha</code> indicates early development; changing
									significantly.</p>
							</li>
							<li>
								<p><code>beta</code> indicates late development; but changing or
									incomplete.</p>
							</li>
							<li>
								<p><code>rc</code> indicates release candidate; complete but not
									approved as operational.</p>
							</li>
							<li>
								<p><code>rev</code> indicates very minor revision that does not
									impact schema validation.</p>
							</li>
						</ul>
					</rule>
				</ruleSection>

				<p>The regular expression notation used above is from <ref idref="W3-XML"/>
					<link href="http://www.w3.org/TR/2008/REC-xml-20081126/#sec-notation"
						>Notation</link>.</p>

				<p>Note that the absence of a <code>status</code> string in the version number
					indicates that the version has been baselined and published.</p>

				<p>The following examples are valid IEPD version numbers:</p>
				<ul>
					<li>
						<p>
							<code>1</code>
						</p>
					</li>
					<li>
						<p>
							<code>1.2</code>
						</p>
					</li>
					<li>
						<p>
							<code>1.3.1.0</code>
						</p>
					</li>
					<li>
						<p>
							<code>1.2alpha13</code>
						</p>
					</li>
					<li>
						<p>
							<code>199.88.15rev6</code>
						</p>
					</li>
				</ul>

				<p>There are two implications in <ref idref="r-iepd-vers-syntax"/>. The first is
					that in some cases this version scheme implies and confirms a chronology of
					releases. For example, a given product labeled version 2.3 must have been
					released before the same product labeled 2.3.1. Therefore, version 2.3.1 is more
					current than version 2.3.</p>

				<p>However, this is a multi-series version scheme, and chronological relationships
					exist only within a given series. So, for example, nothing can be said about a
					chronological relationship between versions 2.2.4 and 2.3. This is because
					version 2.2.4 is in a different series (i.e., 2.2) and could actually have been
					released after 2.3. <ref idref="version-sys"/> illustrates a system of versions
					that uses the numbering scheme of <ref idref="r-iepd-vers-syntax"/>.</p>

				<figure id="version-sys">
					<title>Example versioning system</title>
					<image src="img/version-sys.png"/>
				</figure>

				<p><ref idref="version-sys"/> illustrates eight different version series. Within
					this illustration these are the only sequences that have chronological
					relationships that can be identified through version numbers.</p>
				<ul>
					<li>
						<p>Series 2 is {2.2, 2.3, 2.4}</p>
					</li>
					<li>
						<p>Series 3 is {3.0, 3.1, 3.2}</p>
					</li>
					<li>
						<p>Series 2.2 is {2.2, 2.2.1, 2.2.2, 2.2.3, 2.2.4}</p>
					</li>
					<li>
						<p>Series 2.3 is {2.3, 2.3.1}</p>
					</li>
					<li>
						<p>Series 2.4 is {2.4, 2.4.1}</p>
					</li>
					<li>
						<p>Series 3.0 is {3.0, 3.0.1, 3.0.2}</p>
					</li>
					<li>
						<p>Series 3.1 is {3.1, 3.1.1}</p>
					</li>
					<li>
						<p>Series 3.2 is {3.2, 3.2.1, 3.2.2}</p>
					</li>
				</ul>

				<p>The second implication of <ref idref="r-iepd-vers-syntax"/> is that pre-releases
					are easily identified by the strings <code>alpha</code>, <code>beta</code>, and
						<code>rc</code>. These strings are simple visible indicators of IEPD status
					or stage of development.</p>

				<p>This specification places no further restrictions or meaning (implied or
					otherwise) on a version number. Authors have the option to use integers between
					dots to indicate degree of compatibility or other relationships between versions
					as needed. For example, for a given <termRef
						term="information exchange package documentation">IEPD</termRef>, the author
					may declare that if an instance validates to version 4.2.3, then it will also
					validate to version 4.2. Such a claim is acceptable. However, this specification
					does not imply any such relationships. Any meaning assigned to version sequence
					by an authoritative source should be unambiguously documented within the
						<termRef term="information exchange package documentation"
					>IEPD</termRef>.</p>

				<p>IEPD version numbers within a version series do NOT imply compatibility between
					versions. Compatibility between or among IEPD versions MUST be explicitly stated
					in documentation.</p>

				<p>Note that an author who updates an existing <termRef
						term="information exchange package documentation">IEPD</termRef> to a new
					version may choose the version number based on its previous version number or
					not, as long as it follows the version number syntax. </p>

				<p>Version number syntax applies to IEPDs only; there is no requirement to apply
					this syntax to artifact versioning.</p>

			</section>


			<!-- ################################### URI Schemes #################################### -->


			<section id="URI-Schemes">
				<title>URI Schemes</title>

				<p>All IEPDs use Uniform Resource Identifiers (URIs) to identify artifacts and other
					resources. Several kinds of URIs are employed by IEPDs to reference other IEPDs,
					IEPD artifacts (internally and externally), conformance targets, documents, and
					other resources. For each type of URI used in an IEPD catalog document, this
					section describes its purpose, options, and syntax based on <ref
						idref="RFC3986-URI"/>.</p>

				<p>The following definitions will be useful to understanding IEPD rules defined in
					later subsections that involve various kinds of URIs.</p>

				<definition term="path name">
					<p>A general form of the name of a file or directory that specifies a unique
						location in a file system. A path name points to a file system location by
						following the directory tree hierarchy expressed in a string of characters
						in which path components, separated by a delimiting character, represent
						each subdirectory. If a path name terminates in a file name, then it
						specifies the location of that file.</p>
				</definition>

				<definition term="resolve URI">
					<p>A function (or action) that takes a URI string of the form
							<qName>xs:anyURI</qName> and returns the resource it identifies. If the
						URI is local (i.e., within an <termRef
							term="information exchange package documentation">IEPD</termRef>) and
						the resource does not exist, then this function fails. If a URI is remote or
						of unknown location (e.g., a URN), then this function (or action) may
						require human assistance to determine if a resource associated with the URI
						exists (pass) or not (fail).</p>
				</definition>



				<section id="iepdURI">
					<title>IEPD URI Scheme (<qName>c:iepdURI</qName>)</title>

					<p>To facilitate IEPD sharing and reuse, the assignment of a URI (Uniform
						Resource Identifier) to an IEPD is essential. This is enforced by the IEPD
						catalog schema document <ref idref="IEPD-Catalog-XSD"/>. It is also
						important to ensure that an IEPD URI is absolute.</p>

					<ruleSection>
						<title>IEPD URI Is Absolute</title>
						<rule id="r-iepduri" applicability="WF-IEPD" class="Constraint">
							<p>In an IEPD catalog document, the value of a <qName>c:iepdURI</qName>
								attribute of type <qName>xs:anyURI</qName> MUST match the production
								&lt;absolute-URI&gt; as defined by <ref idref="RFC3986-URI"/>, <a
									href="http://tools.ietf.org/html/rfc3986#section-4.3">
									<char name="sect"/>4.3, <q>Absolute URI</q></a>.</p>
						</rule>
					</ruleSection>

					<p>This rule implies that a URI assigned to an <termRef
							term="information exchange package documentation">IEPD</termRef> must be
						valid. Furthermore, the entity (person or organization) assigning the IEPD
						URI either (1) <em>is</em> the registrant of the domain name or namespace
						identifier, or (2) <em>has</em> authority from the registrant to assign this
						URI.</p>

					<p>Examples of valid IEPD URIs:</p>
					<ul>
						<li>
							<p>
								<code>http://gbi.georgia.gov/gcic/niem/sort-entry/1.1/</code>
							</p>
						</li>
						<li>
							<p>
								<code>http://www.acq.osd.mil/ncbdp/nm/pseag/seiwg-niem/1.0/</code>
							</p>
						</li>
						<li>
							<p>
								<code>http://ncsc.org/niem/icwa/1.0</code>
							</p>
						</li>
						<li>
							<p>
								<code>http://cb.acf.hhs.gov/neice/1.0/exchange/</code>
							</p>
						</li>
					</ul>

					<p>This specification does not mandate that basic IEPD catalog metadata be
						designed into an IEPD URI. However, including such can obviously provide
						convenient visual recognition. That said, an author should ensure any
						metadata embedded in the URI accurately reflect the IEPD catalog metadata
						(in particular, the values of <qName>c:iepdURI</qName>,
							<qName>c:iepdName</qName>, <qName>c:iepdVersionID</qName>, and
							<qName>c:iepdConformanceTargetIdentifierURIList</qName> defined in the IEPD catalog
						document).</p>

				</section>



				<section id="externalURI">
					<title>URI Scheme for IEPD Artifacts (<qName>c:externalURI</qName>)</title>

					<p>Artifacts in other IEPDs can be referenced from within an <termRef
							term="information exchange package documentation">IEPD</termRef> to
						identify equivalence (signify reuse, one aspect of lineage). To support this
						concept, the following IEPD URI rules are necessary:</p>

					<ruleSection>
						<title>IEPD URI Supports Fragment</title>
						<rule id="r-uri-frag" applicability="WF-IEPD" class="Constraint">
							<p>A valid IEPD URI MUST support the inclusion of a <em>fragment
									identifier</em> (as a suffix) <ref idref="RFC3986-URI"/>.</p>
						</rule>
						<p>This rule ensures that an <termRef
								term="information exchange package documentation">IEPD</termRef> can
							always uniquely identify and refer to each artifact within another IEPD.
							This IEPD specification follows <ref idref="RFC3986-URI"/> which forbids
							a URI to contain more than a single fragment identifier. To construct an
							IEPD artifact URI, add a fragment (that locally identifies the artifact)
							to an IEPD URI, and therefore, an IEPD URI cannot already contain a
							fragment.</p>
					</ruleSection>

					<ruleSection>
						<title>IEPD URI Has No Fragment</title>
						<rule id="r-uri-nofrag" applicability="WF-IEPD" class="Constraint">
							<p>A valid IEPD URI MUST NOT contain a <em>fragment identifier</em>
								<ref idref="RFC3986-URI"/>.</p>
						</rule>
						<p>Rationale: If a URI for an <termRef
								term="information exchange package documentation">IEPD</termRef> (do
							NOT confuse this with a URI for an IEPD artifact) already contains a
							fragment identifier, then that URI cannot be employed as an IEPD
							artifact URI, because <ref idref="RFC3986-URI"/> only allows a single
							fragment identifier.</p>
					</ruleSection>

					<p>By the following rule, each file artifact or artifact set is uniquely
						identified by its <termRef>path name</termRef> relative to the <termRef>IEPD
							root directory</termRef>.</p>

					<ruleSection>
						<title>IEPD Artifact URI Syntax</title>
						<rule id="r-iepd-uri-syntax" applicability="WF-IEPD" class="Interpretation">
							<p>Within an <termRef term="information exchange package documentation"
									>IEPD</termRef> a URI reference to an artifact in another
								external IEPD (i.e., an IEPD artifact URI) is the concatenation
								of:</p>
							<ul>
								<li>
									<p>The URI of the <termRef
											term="information exchange package documentation"
											>IEPD</termRef> that contains the artifact.</p>
								</li>
								<li>
									<p>A pound-sign character ("#" <char name="mdash"/> also known
										as a hashtag character).</p>
								</li>
								<li>
									<p>An identifier that is the artifact<char name="rsquo"/>s
										locally unique <termRef>path name</termRef> relative to the
											<termRef>IEPD root directory</termRef>.</p>
								</li>
							</ul>
						</rule>
					</ruleSection>

					<p>An artifact set has a locally unique <termRef>path name</termRef>. An
						artifact has a path name that terminates with its file name which is unique
						to the directory it resides in.</p>

					<p>The following are examples of valid IEPD artifact URIs:</p>
					<ul>
						<li>
							<p><code>http://example.gov/niem-iepd/pmix/3.0/#subset/niem-core.xsd</code>
								(a file artifact)</p>
						</li>
						<li>
							<p><code>http://example.gov/niem-iepd/pmix/3.0beta2/#extension/ext-1.1.xsd</code>
								(a file artifact)</p>
						</li>
						<li>
							<p><code>http://example.gov/niem-iepd/pmix/3.0/#application-info</code>
								(a set artifact)</p>
						</li>
						<li>
							<p><code>http://example.gov/niem-iepd/pmix/3.0/#iep-sample/query</code>
								(a set artifact)</p>
						</li>
					</ul>

					<p>Artifact URIs are used as values for the <qName>c:externalURI</qName>
						attribute in the IEPD catalog XML document to declare equivalence
						relationships between artifacts (See <ref idref="IEPD-Catalog-XSD"/>). A
						simple scenario follows. Consider two different IEPDs with the following
						URIs:</p>
					<ol>
						<li>
							<p>
								<code>http://example.gov/niem-iepd/pmix/3.0/</code>
							</p>
						</li>
						<li>
							<p>
								<code>http://www.abc.org/niem-iepd/order/2.1.2rev3/</code>
							</p>
						</li>
					</ol>

					<p>The author of <termRef term="information exchange package documentation"
							>IEPD</termRef> (2) has decided to reuse the
							<code>base-xsd/extension/req1.xsd</code> artifact in <termRef
							term="information exchange package documentation">IEPD</termRef> (1)
						as-is. They can optionally create an IEPD catalog
							<qName>c:ExtensionSchemaDocument</qName> entry for this artifact
						(assuming it is an extension schema document), and add the attribute:</p>
					<blockquote>
						<p>
							<code>c:externalURI="http://example.org/niem-iepd/pmix/3.0/#base-xsd/extension/req1.xsd"</code>
						</p>
					</blockquote>

					<p>Additional <qName>c:externalURI</qName> attributes may be added to this entry
						if the author knows of other uses of this same artifact in other IEPDs and
						wishes to acknowledge them.</p>

					<p>A URI does not have the same meaning as namespace. NIEM namespaces cannot be
						used as IEPD artifact URIs. Recall that the target namespace used in a
						subset schema document derived from a NIEM release schema document is
						identical to the target namespace of that release schema document.
						Furthermore, an <termRef term="information exchange package documentation"
							>IEPD</termRef> may contain multiple subsets. NIEM namespaces are not
						necessarily unique to an artifact within an <termRef
							term="information exchange package documentation">IEPD</termRef>. Later,
							<ref idref="XML-Catalogs"/> will describe the use of <ref
							idref="OASIS-XML-Catalogs"/> to correlate namespaces to local URIs in
						order to <termRef term="resolve URI">resolve</termRef> them to local
						resources.</p>

					<p>The value of <qName>c:externalURI</qName> is an identifier for a remote
						resource that is not necessarily accessible online. For this reason, even
						though such URIs should be correct (i.e. a resource with that URI should
						exist), their verification is not within the scope of this
						specification.</p>

				</section>



				<section id="pathURI">
					<title>URI Scheme for Local IEPD Artifacts (<qName>c:pathURI</qName>)</title>

					<p>An IEPD uses the file directory system of path names and file names to
						identify local artifacts and artifact sets. All local URIs are relative to
						the location of the <termRef>IEPD catalog document</termRef>, and therefore,
						they are also relative to the <termRef>IEPD root directory</termRef> since
						the IEPD catalog document resides in the IEPD root directory.</p>

					<p>In general, every value of attribute <qName>c:pathURI</qName> in an IEPD
						catalog document will be a relative <termRef>path name</termRef> to a
						directory (i.e., an artifact set), or to a file (i.e., an artifact). The
						following are typical examples of each:</p>
					<blockquote>
						<p>Artifact Set: <code>c:pathURI="base-xsd/niem/niem-core/3.0"</code></p>
						<p>Artifact: <char name="nbsp"/><char name="nbsp"/><char name="nbsp"/><char
								name="nbsp"/>
							<code>c:pathURI="base-xsd/niem/niem-core/3.0/niem-core.xsd"</code></p>
					</blockquote>

					<p>Note that per <ref idref="uri-syntax"/> and <ref idref="uri-summary"/> a
						local URI may contain an optional fragment. Although
							<qName>c:pathURI</qName> has no use for a URI with a fragment, IEPD
						documentation artifacts could reference a subpart within a local artifact by
						using a relative URI with a fragment.</p>

					<p>Despite its simplicity, <qName>c:pathURI</qName> comes with over a dozen
						rules that help to define an <termRef>information exchange package
							documentation</termRef>. These rules ensure that every
							<qName>c:pathURI</qName> attribute value in a well-formed <termRef
							term="information exchange package documentation">IEPD</termRef>
						resolves to a correct local resource:</p>

					<ruleSection>
						<title><qName>c:pathURI</qName> Resolves to a Resource</title>
						<rule id="wfm2" applicability="WF-IEPD" class="Constraint">
							<p>Within an <termRef>IEPD catalog document</termRef>, the value of a
									<qName>c:pathURI</qName> attribute MUST <termRef
									term="resolve URI">resolve</termRef> to a resource.</p>
						</rule>
					</ruleSection>

					<ruleSection>
						<title><qName>c:pathURI</qName> for <qName>c:XMLCatalog</qName></title>
						<rule id="wfm3" applicability="WF-IEPD" class="Constraint">
							<p>Within an <termRef>IEPD catalog document</termRef>, the value of a
									<qName>c:pathURI</qName> attribute owned by a
									<qName>c:XMLCatalog</qName> element MUST <termRef
									term="resolve URI">resolve</termRef> to an <termRef>XML catalog
									document</termRef>.</p>
						</rule>
					</ruleSection>

					<ruleSection>
						<title><qName>c:pathURI</qName> for <qName>c:IEPDChangeLog</qName></title>
						<rule id="wfm4" applicability="WF-IEPD" class="Constraint">
							<p>Within an <termRef>IEPD catalog document</termRef>, the value of a
									<qName>c:pathURI</qName> attribute owned by a
									<qName>c:IEPDChangeLog</qName> element MUST <termRef
									term="resolve URI">resolve</termRef> to a <termRef>change
									log</termRef>.</p>
						</rule>
					</ruleSection>

					<ruleSection>
						<title><qName>c:pathURI</qName> for <qName>c:ReadMe</qName></title>
						<rule id="wfm5" applicability="WF-IEPD" class="Constraint">
							<p>Within an <termRef>IEPD catalog document</termRef>, the value of a
									<qName>c:pathURI</qName> attribute owned by a
									<qName>c:ReadMe</qName> element MUST <termRef term="resolve URI"
									>resolve</termRef> to a <termRef>readme artifact</termRef>.</p>
						</rule>
					</ruleSection>

					<ruleSection>
						<title><qName>c:pathURI</qName> for
							<qName>c:IEPSampleXMLDocument</qName></title>
						<rule id="wfm6" applicability="WF-IEPD" class="Constraint">
							<p>Within an <termRef>IEPD catalog document</termRef>, the value of a
									<qName>c:pathURI</qName> attribute owned by a
									<qName>c:IEPSampleXMLDocument</qName> element MUST <termRef
									term="resolve URI">resolve</termRef> to an <termRef>XML
									document</termRef>.</p>
						</rule>
					</ruleSection>

					<ruleSection>
						<title><qName>c:pathURI</qName> for
							<qName>c:BusinessRulesArtifact</qName></title>
						<rule id="wfm7" applicability="WF-IEPD" class="Constraint">
							<p>Within an <termRef>IEPD catalog document</termRef>, the value of a
									<qName>c:pathURI</qName> attribute owned by a
									<qName>c:BusinessRulesArtifact</qName> element MUST <termRef
									term="resolve URI">resolve</termRef> to a <termRef>business rule
									schema</termRef> or <termRef>business rules</termRef>
								artifact.</p>
						</rule>
					</ruleSection>

					<ruleSection>
						<title><qName>c:pathURI</qName> for
							<qName>c:XMLSchemaDocument</qName></title>
						<rule id="wfm8a" applicability="WF-IEPD" class="Constraint">
							<p>Within an <termRef>IEPD catalog document</termRef>, the value of a
									<qName>c:pathURI</qName> attribute owned by a
									<qName>c:XMLSchemaDocument</qName> element MUST <termRef
									term="resolve URI">resolve</termRef> to an <termRef>XML schema
									document</termRef>.</p>
						</rule>
					</ruleSection>

					<ruleSection>
						<title><qName>c:pathURI</qName> for
							<qName>c:ExternalSchemaDocument</qName></title>
						<rule id="wfm8" applicability="WF-IEPD" class="Constraint">
							<p>Within an <termRef>IEPD catalog document</termRef>, the value of a
									<qName>c:pathURI</qName> attribute owned by a
									<qName>c:ExternalSchemaDocument</qName> element MUST <termRef
									term="resolve URI">resolve</termRef> to an <termRef>XML schema
									document</termRef>.</p>
						</rule>
					</ruleSection>

					<ruleSection>
						<title><qName>c:pathURI</qName> for
							<qName>c:ReferenceSchemaDocument</qName></title>
						<rule id="wfm9" applicability="WF-IEPD" class="Constraint">
							<p>Within an <termRef>IEPD catalog document</termRef>, the value of a
									<qName>c:pathURI</qName> attribute owned by a
									<qName>c:ReferenceSchemaDocument</qName> element MUST <termRef
									term="resolve URI">resolve</termRef> to a NIEM
									<termRef>reference schema document</termRef>.</p>
						</rule>
					</ruleSection>

					<ruleSection>
						<title><qName>c:pathURI</qName> for
							<qName>c:ExtensionSchemaDocument</qName></title>
						<rule id="wfm10" applicability="WF-IEPD" class="Constraint">
							<p>Within an <termRef>IEPD catalog document</termRef>, the value of a
									<qName>c:pathURI</qName> attribute owned by a
									<qName>c:ExtensionSchemaDocument</qName> element MUST <termRef
									term="resolve URI">resolve</termRef> to a NIEM
									<termRef>extension schema document</termRef>.</p>
						</rule>
					</ruleSection>

					<ruleSection>
						<title><qName>c:pathURI</qName> for
							<qName>c:SubsetSchemaDocument</qName></title>
						<rule id="wfm11" applicability="WF-IEPD" class="Constraint">
							<p>Within an <termRef>IEPD catalog document</termRef>, the value of a
									<qName>c:pathURI</qName> attribute owned by a
									<qName>c:SubsetSchemaDocument</qName> element MUST <termRef
									term="resolve URI">resolve</termRef> to a NIEM <termRef>subset
									schema document</termRef>.</p>
						</rule>
						<p>Note: It is not possible for a Schematron rule to verify that the URI
							resolves to a NIEM subset schema document, only that it is a schema
							document.</p>
					</ruleSection>

					<ruleSection>
						<title><qName>c:pathURI</qName> for <qName>c:Wantlist</qName></title>
						<rule id="wfm12" applicability="WF-IEPD" class="Constraint">
							<p>Within an <termRef>IEPD catalog document</termRef>, the value of a
									<qName>c:pathURI</qName> attribute owned by a
									<qName>c:Wantlist</qName> element MUST <termRef
									term="resolve URI">resolve</termRef> to a <termRef>NIEM
									wantlist</termRef> XML document.</p>
						</rule>
					</ruleSection>

					<ruleSection>
						<title><qName>c:pathURI</qName> for
							<qName>c:SchematronSchema</qName></title>
						<rule id="wfm13" applicability="WF-IEPD" class="Constraint">
							<p>Within an <termRef>IEPD catalog document</termRef>, the value of a
									<qName>c:pathURI</qName> attribute owned by a
									<qName>c:SchematronSchema</qName> element MUST <termRef
									term="resolve URI">resolve</termRef> to a <termRef>Schematron
									schema</termRef>.</p>
						</rule>
					</ruleSection>

					<ruleSection>
						<title><qName>c:pathURI</qName> for <qName>c:RelaxNGSchema</qName></title>
						<rule id="wfm14" applicability="WF-IEPD" class="Constraint">
							<p>Within an <termRef>IEPD catalog document</termRef>, the value of a
									<qName>c:pathURI</qName> attribute owned by a
									<qName>c:RelaxNGSchema</qName> element MUST <termRef
									term="resolve URI">resolve</termRef> to a RelaxNG schema.</p>
						</rule>
					</ruleSection>

					<ruleSection>
						<title><qName>c:pathURI</qName> for
							<qName>c:SchemaDocumentSet</qName></title>
						<rule id="wfm15" applicability="WF-IEPD" class="Constraint">
							<p>Within an <termRef>IEPD catalog document</termRef>, the value of a
									<qName>c:pathURI</qName> attribute owned by a
									<qName>c:SchemaDocumentSet</qName> element MUST <termRef
									term="resolve URI">resolve</termRef> to an <termRef>XML schema
									document</termRef> set.</p>
						</rule>
					</ruleSection>

					<ruleSection>
						<title><qName>c:pathURI</qName> for
								<qName>c:ConstraintSchemaDocumentSet</qName></title>
						<rule id="r1-csds" applicability="WF-IEPD" class="Constraint">
							<p>Within an <termRef>IEPD catalog document</termRef>, the value of a
									<qName>c:pathURI</qName> attribute owned by a
									<qName>c:ConstraintSchemaDocumentSet</qName> element MUST
									<termRef term="resolve URI">resolve</termRef> to a NIEM
									<termRef>XML schema document</termRef> set.</p>
						</rule>
					</ruleSection>

					<ruleSection>
						<title>Schema document set interpreted as constraint schema document
							set</title>
						<rule id="r2-csds" applicability="WF-IEPD" class="Interpretation">
							<p>Any <termRef>XML schema document</termRef> set whose
									<qName>c:pathURI</qName> attribute resolves to a
									<termRef>constraint schema document set</termRef> MUST be
								interpreted to be a <termRef>constraint schema document
									set</termRef>.</p>
						</rule>
					</ruleSection>

				</section>



				<section id="IEPD-Relationships">
					<title>IEPD Relationships and Lineage (<qName>c:resourceURI</qName>)</title>

					<p>An important business requirement is transparency of IEPD lineage. Data
						lineage is also referred to as <em>data provenance</em>, how the data was
						derived and where it came from. There are two basic views of data
						provenance: (1) as data annotations; and (2) as a graph of data
						relationships <ref idref="Principles-of-Data-Integration"/>, Chapter 14
							<q>Data Provenance</q>.</p>

					<p>The IEPD Specification adapts the latter view of data provenance to enable a
						simple framework for recording IEPD lineage within an IEPD catalog. The URI
						scheme for IEPDs and their artifacts and sets enables a graph of
						relationships. An <termRef term="information exchange package documentation"
							>IEPD</termRef> may internally identify and record relationships to
						other IEPDs, including families, versions, adaptations, specializations,
						generalizations, etc.</p>

					<p>The next few paragraphs require understanding of URIs for IEPDs and IEPD
						artifacts. See <ref idref="iepdURI"/> and <ref idref="externalURI"/>.</p>

					<p>The IEPD catalog provides a <qName>c:Relationship</qName> element with two
						attributes (<qName>c:resourceURI</qName> and
							<qName>c:relationshipCode</qName>) and an optional element
							(<qName>nc:DescriptionText</qName>) to identify ancestry and other
						relationships to other IEPDs. There are many ways that one <termRef
							term="information exchange package documentation">IEPD</termRef> may
						relate to another. This makes it difficult to specify a fixed set of values
						that can objectively define an exact relationship between a pair of IEPDs.
						Therefore, the optional <qName>nc:DescriptionText</qName> element is
						provided to further explain the nature of any of the
							<qName>c:relationshipCode</qName> values. The set is:
							{<code>version_of</code>, <code>specializes</code>,
							<code>generalizes</code>, <code>deprecates</code>,
							<code>supersedes</code>, <code>adapts</code>, <code>conforms_to</code>,
							<code>updates</code>}. In some cases, the value of
							<qName>c:relationshipCode</qName> may be generic enough to require a
						more detailed explanation in <qName>nc:DescriptionText</qName> (for example,
						if its value is <code>adapts</code>).</p>

					<p>As was described in <ref idref="externalURI"/>, the IEPD catalog also enables
						an author to record more fine-grained ancestry between IEPDs using the
							<qName>c:externalURI</qName> attribute. This attribute records an
						explicit equivalence relationship between artifacts reused across IEPDs.</p>

					<p>Note that a <qName>c:resourceURI</qName> attribute is used to identify a
						remote resource that is only related to the IEPD whose catalog declares it.
						The resource is not required for validation. Therefore, the <termRef
							term="information exchange package documentation">IEPD</termRef> is not
						required to contain this resource. As in the case of
							<qName>c:externalURI</qName>, the value of a
							<qName>c:resourceURI</qName> should be correct (i.e., a resource with
						that URI should exist). However, in this case, existence verification is
						considered outside the scope of this specification.</p>

				</section>



				<section id="Resolve-URI-W-Fragment">
					<title>Resolving an IEPD URI with a Fragment</title>

					<ruleSection>
						<title>Resolve IEPD URI with Fragment</title>
						<rule id="r-resolve-uri" applicability="WF-IEPD" class="Interpretation">
							<p>Given an absolute IEPD URI <ref idref="RFC3986-URI"/>, <a
									href="http://tools.ietf.org/html/rfc3986#section-4.3">
									<char name="sect"/>4.3, <q>Absolute URI</q></a> with a fragment,
								resolve this URI as follows:</p>
							<ol>
								<li>
									<p>Resolve the base URI (per <ref idref="RFC3986-URI"/>) to
										retrieve the resource IEPD. If the resource IEPD does not
										exist, then fail (existence error).</p>
								</li>
								<li>
									<p>Apply the fragment (without "#") to the IEPD resource:</p>
									<ol>
										<li>
											<p>Locate a <qName>structures:id</qName> attribute value
												that matches the fragment string. If more than one
												exist, then fail (ambiguity error). If none exists,
												then continue.</p>
										</li>
										<li>
											<p>Locate a <termRef>path name</termRef> (for a
												directory or file) that matches the fragment string.
												If more than one exist, then fail (ambiguity error).
												If none exists, then fail (existence error).</p>
										</li>
									</ol>
								</li>
								<li>
									<p>Return the element, directory, or file found.</p>
								</li>
							</ol>
						</rule>
					</ruleSection>

					<p>In the presence of NIEM reference elements, URI resolution may require an additional step to
						account for indirect references. Be sure to review <ref
							idref="URI-Resolution-Ref-Elements"/> if this case applies.</p>

				</section>



				<section id="URI-Resolution-Ref-Elements">
					<title>URI Resolution Involving Reference Elements</title>

					<p>A NIEM element can indirectly reference its content rather than carry or
						encapsulate it. A NIEM element with simple content derived from type
						<qName>xs:anyURI</qName> may appear in an instance XML document as an element information item that has an attribute <qName>xs:anyURI</qName>, in which case, rather than locally containing a URI as
						simple content, it will instead refer to another element that contains a
						URI. Under some circumstances, this might impact URI resolution described in
						<ref idref="r-resolve-uri"/>.</p>

					<p>Thus, the <qName>structures:ref</qName> attribute value refers to another
						element that carries the content (for both elements) and owns a
							<qName>structures:id</qName> attribute with a value equal to that of
							<qName>structures:ref</qName>.</p>

					<p>The <termRef>IEPD catalog document</termRef> reuses NIEM Core and so it
						conforms to NIEM. Therefore, one or more NIEM reference elements from various
						locations may refer to a single content bearing instance of the same element
						(with a unique <qName>structures:id</qName>). The definition of
						<termRef>resolve URI</termRef> and the URI-related rules in this section
						assume content bearing elements. If a URI resolution rule applies to an
						element in reference element form, then URI resolution
						will be applied at the site of the content-bearing element form it refers to
						(where the URI will be).</p>

				</section>



				<section id="XML-Catalog-URI">
					<title>XML Catalog URI</title>

					<p>An <termRef>XML catalog document</termRef> conforms to <ref
							idref="OASIS-XML-Catalogs"/>. For the purpose of IEPD validation, the
						following rules ensure that an XML catalog document contains URIs that
						correctly resolve.</p>

					<ruleSection>
						<title>XML Catalog <code>uri</code> Value Resolves to Resource</title>
						<rule id="xc1" applicability="XML-catalog" class="Constraint">
							<p>Within an <termRef>XML catalog document</termRef>, the value of a
									<code>uri</code> attribute owned by a <qName>er:uri</qName>
								element MUST <termRef term="resolve URI">resolve</termRef> to a
								resource.</p>
						</rule>
					</ruleSection>

					<ruleSection>
						<title>XML Catalog <code>uri</code> Value Resolves to Resource with Correct
							Target Namespace</title>
						<rule id="xc2" applicability="XML-catalog" class="Constraint">
							<p>Within an <termRef>XML catalog document</termRef>, given an
									<termRef>XML schema document</termRef> resolved by the value of
								a <code>uri</code> attribute owned by a <qName>er:uri</qName>
								element, the <termRef>XML schema document</termRef> target namespace
								MUST equal the value of the <code>name</code> (a namespace string)
								attribute owned by the <qName>er:uri</qName> element.</p>
						</rule>
					</ruleSection>

				</section>



				<section id="URI-Summary">
					<title>Summary of IEPD URIs</title>

					<p>This section summarizes the various URIs used in the IEPD catalog document.
						It also presents a summary of <ref idref="RFC3986-URI"/>. See that reference
						for explanation and details of URI syntax.</p>

					<table id="uri-syntax">
						<title>Summary of<link href="http://tools.ietf.org/html/rfc3986">
								<q>RFC 3986 URI: Generic Syntax</q></link></title>
						<theadr>
							<th>Id</th>
							<th>URI Syntax</th>
							<th>Meaning</th>
							<th>Examples</th>
						</theadr>
						<tr>
							<td>1</td>
							<td>&lt;absolute-URI&gt;</td>
							<td>absolute URI only (no fragment)</td>
							<td>
								<code>http://nlets.org/rap/3.1/</code>
							</td>
						</tr>
						<tr>
							<td>2</td>
							<td>&lt;URI&gt;</td>
							<td>absolute URI and optional fragment</td>
							<td>
								<code>http://nlets.org/rap/3.1/#rap-sheet2</code>
							</td>
						</tr>
						<tr>
							<td>3</td>
							<td>&lt;relative-reference&gt;</td>
							<td>optional relative part and optional fragment</td>
							<td><code>/iep-sample/query.xml </code>or<code> #A3 </code>or<code>
									/iep-sample/query.xml#A3</code></td>
						</tr>
						<tr>
							<td>4</td>
							<td>&lt;URI-reference&gt;</td>
							<td>&lt;URI&gt; or &lt;relative-reference&gt;</td>
							<td>any example in 1, 2, or 3 above</td>
						</tr>
					</table>

					<p>
						<char name="nbsp"/>
					</p>

					<p>As the table above indicates, <ref idref="RFC3986-URI"/> allows a
						&lt;relative-reference&gt; to contain a fragment or even be a fragment
						itself. However, a <qName>c:pathURI</qName> is required to resolve to a
						local resource. Therefore, rules in this specification preclude a
							<qName>c:pathURI</qName> value from taking the fragment-only form of a
						&lt;relative-reference&gt;.</p>

					<table id="uri-summary">
						<title>Summary of IEPD URI attributes</title>
						<theadr>
							<th>IEPD Attribute</th>
							<th>URI Syntax (refer to table above)</th>
						</theadr>
						<tr>
							<td>
								<qName>c:iepdURI</qName>
							</td>
							<td>&lt;absolute-URI&gt;</td>
						</tr>
						<tr>
							<td>
								<qName>c:pathURI</qName>
							</td>
							<td>&lt;relative-reference&gt;; excluding fragment-only format; relative
								to <termRef>IEPD catalog document</termRef></td>
						</tr>
						<tr>
							<td>
								<qName>c:externalURI</qName>
							</td>
							<td>&lt;URI&gt;</td>
						</tr>
						<tr>
							<td>
								<qName>c:resourceURI</qName>
							</td>
							<td>&lt;URI&gt;</td>
						</tr>
					</table>

					<p>
						<char name="nbsp"/>
					</p>

				</section>

			</section>
		</section>


		<!-- ################################### Change Log ################################### -->


		<section id="Change-Log">
			<title>Change Log</title>

			<p>A version identifier is a useful and simple visual indicator that an <termRef
					term="information exchange package documentation">IEPD</termRef> has changed.
				However, a <em>change log</em> is needed to understand the volume, complexity, and
				possible impact of changes.</p>

			<definition term="change log">
				<p>An artifact that describes the changes applied to an <termRef
						term="information exchange package documentation">IEPD</termRef> since its
					previous version.</p>
			</definition>

			<p>An <termRef term="information exchange package documentation">IEPD</termRef> change
				log is not required to conform to any particular XML schema or other format
				specification. However, a change log is still required for an <termRef
					term="information exchange package documentation">IEPD</termRef>.</p>

			<ruleSection>
				<title>IEPD Has a Change Log</title>
				<rule id="r-iepd-changelog-iepd" applicability="IEPD" class="Constraint">
					<p>An <termRef term="information exchange package documentation">IEPD</termRef>
						MUST contain a <termRef>change log</termRef> artifact that is identified by
						a <qName>c:IEPDChangeLog</qName> element in its <termRef>IEPD catalog
							document</termRef>.</p>
				</rule>
			</ruleSection>

			<p>The <termRef>change log</termRef> for the first version release of an IEPD simply
				contains its release date.</p>

			<p>The format of an <termRef term="information exchange package documentation"
					>IEPD</termRef> change log is left to the discretion of the author. A flexible
					<termRef>change log</termRef> format encourages and facilitates easier and more
				rapid development. IEPDs are developed by a variety of NIEM domains, organizations,
				and users; and they are intended to specify implementable exchanges. As a result, an
					<termRef term="information exchange package documentation">IEPD</termRef> may
				contain both documentation artifacts and machine readable application artifacts in a
				large variety of formats. As a result, a consistent standard <termRef>change
					log</termRef> would be very difficult to specify.</p>

		</section>


		<!-- ################################## ReadMe ###################################### -->


		<section id="ReadMe-Artifact">
			<title>ReadMe Artifact</title>

			<definition term="readme artifact">
				<p>An informal documentation artifact contained in an <termRef>information exchange
					package documentation</termRef> that serves as the initial general source of
					human readable descriptive or instructional information. A <em>readme</em>
					artifact or file (formerly known as a <em>master document</em>) may index or
					reference other more specific documentation or other explanatory materials
					within the <termRef term="information exchange package documentation"
						>IEPD</termRef>.</p>
			</definition>

			<ruleSection>
				<title>Readme Describes Purpose, Scope, Business Value, etc.</title>
				<rule id="r-iepd-readme-purpose" applicability="WF-IEPD" class="Interpretation">
					<p>A <termRef>readme artifact</termRef> SHOULD (at a minimum) describe the
							<termRef term="information exchange package documentation"
							>IEPD</termRef> purpose, scope, business value, exchange information,
						typical senders/receivers, interactions, and references to other
						documentation.</p>
				</rule>
			</ruleSection>

			<ruleSection>
				<title>IEPD Has a ReadMe Artifact</title>
				<rule id="r-iepd-readme" applicability="IEPD" class="Constraint">
					<p>An IEPD MUST contain a <termRef>readme artifact</termRef> that is identified
						by a <qName>c:ReadMe</qName> element in its <termRef>IEPD catalog
							document</termRef>.</p>
				</rule>
			</ruleSection>

			<p>The <termRef>readme artifact</termRef> may replicate some of the metadata in the IEPD
				catalog. However, the IEPD catalog is intentionally designed to be efficient, easy
				to parse, and minimal. It is intended for search, discovery, registration, and Web
				page generation, and not to support various types of detailed technical prose often
				required for human understanding.</p>

			<p>The primary purposes of the <termRef>readme artifact</termRef> include:</p>
			<ul>
				<li>
					<p>To help facilitate understanding and reuse of IEPDs.</p>
				</li>
				<li>
					<p>To ensure that fundamental and detailed business-level information about an
							<termRef term="information exchange package documentation"
							>IEPD</termRef> are documented for human understanding.</p>
				</li>
				<li>
					<p>To ensure the <termRef term="information exchange package documentation"
							>IEPD</termRef> author has considered and conveys such fundamental
						information.</p>
				</li>
				<li>
					<p>To provide an initial source within an <termRef
							term="information exchange package documentation">IEPD</termRef> for
						human consumable documentation and/or references to other business or
						technical documentation needed for understanding.</p>
				</li>
			</ul>

			<p>The <termRef>readme artifact</termRef> is not intended to be the only source of
				written documentation for an IEPD (though it can be). It is expected to be the
				initial resource that references and coordinates all others whether physically
				present in the IEPD or linked by reference. Many organizations have their own
				customized formats and operating procedures for documenting their work and products.
				This specification does not attempt to standardize readme file name, location,
				format, or layout; only that it be identified in the <termRef>IEPD catalog
					document</termRef> of an IEPD. The following section will generally describe
				minimal content that should be in the <termRef>readme artifact</termRef>. This
				guidance is non-normative, so adherence is a subjective judgment by the author.</p>



			<section id="Readme-Content">
				<title>Readme Content</title>

				<p>This section is non-normative.</p>

				<p>This section is neither a cookbook nor a normative specification for a
						<termRef>readme artifact</termRef>. It simply suggests typical topics that a
					readme artifact should or might address, and provides some non-normative
					guidance.</p>

				<p>The readme file should help another user or developer to understand the content
					and use of an <termRef term="information exchange package documentation"
						>IEPD</termRef>, as well as determine potential for reuse or adaptation. It
					should describe what implementers need to understand and what the author
					considers is important to understanding an <termRef
						term="information exchange package documentation">IEPD</termRef>. There is
					no limit or constraint on its content.</p>

				<p>At a minimum, the <termRef>readme artifact</termRef> should contain several
					fundamental elements of information about the IEPD:</p>
				<ul>
					<li>
						<p>Purpose of this IEPD.</p>
					</li>
					<li>
						<p>Scope of its deployment, usage, and information content.</p>
					</li>
					<li>
						<p>Business value and rationale for developing it.</p>
					</li>
					<li>
						<p>Type of information it is intended to exchange (in business terms).</p>
					</li>
					<li>
						<p>Identification of senders and receivers (or the types of senders and
							receivers).</p>
					</li>
					<li>
						<p>Typical interactions between senders, receivers, and systems.</p>
					</li>
					<li>
						<p>References to other documentation within the IEPD, and links to external
							documents that may be needed to understand and implement it.</p>
					</li>
				</ul>

				<p>Many document formats (e.g., HTML, PDF) can display hyperlinks to local files
					within the IEPD as well as URLs to files on the Internet. Employing such a
					format is highly recommended but not mandatory.</p>

				<p>IEPD documentation types and formats will vary with the methodologies and tools
					used to develop them. Most of this documentation will likely be typical of that
					generated for data-oriented software projects. Some documentation may only
					require sections in the <termRef>readme artifact</termRef>. Other documentation
					may be more suitable as separate artifacts that are referenced and explained by
					a section in the <termRef>readme artifact</termRef> (such as diagrams, large
					tables, data dictionaries, test results/reports, etc.). The following are some
					common examples of sections in or separate artifacts associated with the
						<termRef>readme artifact</termRef>:</p>

				<ul>
					<li>
						<p>Executive summary (especially for a lengthy readme artifact)</p>
					</li>
					<li>
						<p>Use cases</p>
					</li>
					<li>
						<p>Business processes</p>
					</li>
					<li>
						<p>Business requirements</p>
					</li>
					<li>
						<p>Business rules</p>
					</li>
					<li>
						<p>Metadata security considerations</p>
					</li>
					<li>
						<p>Domain model design specifications and documentation and/or diagrams</p>
					</li>
					<li>
						<p>Data dictionary</p>
					</li>
					<li>
						<p>Testing and conformance</p>
					</li>
					<li>
						<p>Development tools and methodologies used</p>
					</li>
					<li>
						<p>Implementation guidance (particularly important for a complex <termRef
								term="information exchange package documentation">IEPD</termRef>
							with multiple subsets or IEP root elements)</p>
					</li>
					<li>
						<p>Security considerations</p>
					</li>
					<li>
						<p>Privacy considerations (e.g., Personal Identifiable Information)</p>
					</li>
					<li>
						<p>Types of implementations</p>
					</li>
					<li>
						<p>If an <termRef term="information exchange package documentation"
								>IEPD</termRef> employs multiple subsets:</p>
						<ul>
							<li>
								<p>When, where, and how these are used</p>
							</li>
							<li>
								<p>How these are coordinated in the implementation</p>
							</li>
							<li>
								<p>Caveats regarding duplicate <termRef term="data component">data
										components</termRef> (which can occur with multiple
									subsets)</p>
							</li>
						</ul>
					</li>
					<li>
						<p>If an <termRef term="information exchange package documentation"
								>IEPD</termRef> employs multiple IEP conformance targets:</p>
						<ul>
							<li>
								<p>Purpose of each and when it should be used</p>
							</li>
							<li>
								<p>How these are coordinated during the runtime preparation and
									transmission of IEPs</p>
							</li>
						</ul>
					</li>
				</ul>

			</section>
		</section>


		<!-- ################################ XML Catalogs ##################################### -->


		<section id="XML-Catalogs">
			<title>XML Catalogs</title>

			<definition term="XML catalog document">
				<p>As defined by <ref idref="OASIS-XML-Catalogs"/>, which states:</p>
				<blockquote>
					<p>An entity catalog.</p>
				</blockquote>

				<p>An <termRef>XML catalog document</termRef> MUST conform to all the rules in this
					specification for the conformance target <termRef>XML catalog
					document</termRef>.</p>

				<p>Rules specifying this conformance target use the applicability code
						<q>XML-catalog</q>.</p>
			</definition>

			<p>An <termRef>XML catalog document</termRef> is an <termRef>instance XML
					document</termRef> that describes a mapping between external entity references
				and locally-cached equivalents. It associates a URI reference with information about
				an external reference that appears in an XML document. An <termRef>XML catalog
					document</termRef> can be used to locate the replacement text for an external
				entity, or an alternate URI reference for a resource.</p>

			<p>An IEPD can use an <termRef>XML catalog document</termRef> to <termRef
					term="resolve URI">resolve</termRef> XML schema document target namespaces to
				local URIs. This is especially useful when assembling an XML schema from an XML
				schema document set. Some validators (e.g., <link
					href="http://xerces.apache.org/xerces2-j/faq-xcatalogs.html">Xerces</link>) and
				other tools utilize <termRef term="XML catalog document">XML catalog
					documents</termRef> for this purpose.</p>

			<p><termRef term="information exchange package documentation">IEPD</termRef> authors are
				encouraged to employ <termRef term="XML catalog document">XML catalog
					documents</termRef> within IEPDs to facilitate validation of IEPs.</p>

			<p>Note that schema assembly or <termRef>XML catalog document</termRef> design from
				non-conformant <termRef term="external schema document">external schema
					documents</termRef> that may contain <qName>xs:include</qName> statements can be
				problematic.</p>

			<p>In order to support <termRef>XML schema assembly</termRef> for the purpose of
					<termRef>XML schema validation</termRef>, the namespace of each XML schema
				document used within an <termRef term="information exchange package documentation"
					>IEPD</termRef> should <termRef term="resolve URI">resolve</termRef> to a
				locally-unique artifact. A correctly constructed <termRef>XML catalog
					document</termRef> can guarantee this.</p>

			<p>According to <ref idref="OASIS-XML-Catalogs"/>, <qName>er:nextCatalog</qName>
				elements may be used within <termRef term="XML catalog document">XML catalog
					documents</termRef> to connect them and control the parsing sequence. <ref
					idref="Defining-Information-Exchange-Packages"/> discusses more about using
					<termRef term="XML catalog document">XML catalog documents</termRef> within
				IEPDs.</p>

			<p>According to <ref idref="W3-XML-Schema-Structures"/>, the assembly of a schema
				document set into a schema is implementation-dependent. In practice, different tools
				use different methods for selecting the next schema document in the assembly
				process. This specification recommends the use of <termRef
					term="XML catalog document">XML catalog documents</termRef> as the preferred
				method for describing the desired schema assembly (for validation or other
				purposes).</p>

			<p>The IEPD catalog schema document defines a <qName>c:XMLSchemaType</qName> that
				contains both <qName>c:XMLSchemaDocument</qName> elements and
					<qName>c:XMLCatalog</qName> elements, which may appear interleaved, or in any
				order. Occurrences of the <qName>c:XMLSchemaDocument</qName> identify schema
				documents to be used in schema assembly. <qName>c:XMLCatalog</qName> identifies the
					<termRef term="XML catalog document">XML catalog documents</termRef> to be used
				to identify schema documents, each corresponding to an XML namespace, which may be
				used in schema assembly. Relative order of <qName>c:XMLCatalog</qName> entries is
				considered significant, with catalogs appearing earlier taking precedence over
				catalogs appearing later. Note that the schema document assembly process does not
				specify a document element for an <termRef>instance XML document</termRef>; this may
				be specified with other mechanisms provided by the IEPD catalog, such as Schematron,
				XPath expressions, or by explicitly setting a document element.</p>

			<p>This document does not specify the schema assembly process. A deterministic,
				implementation-independent schema assembly process may be the subject of a later
				NIEM specification.</p>

		</section>


		<!-- ###################### Defining information exchange packages ###################### -->


		<section id="Defining-Information-Exchange-Packages">
			<title>Defining Information Exchange Packages</title>

			<p>An IEPD may declare one or more <em>IEP conformance targets</em> within its
					<termRef>IEPD catalog document</termRef>.</p>

			<definition term="IEP conformance target" id="iep-conformance-target">
				<p>A <termRef>conformance target</termRef> that is a class or category of IEP which
					has a set of one or more validity constraints and a <termRef>conformance target
						identifier</termRef>. Every IEP is an instance of one or more <em>IEP
						conformance targets</em>.</p>
			</definition>

			<p>This definition requires that an IEP conformance target be assigned a
					<termRef>conformance target identifier</termRef> that distinguishes it from all
				other <termRef term="IEP conformance target">IEP conformance targets</termRef>.
				Construct a <termRef>conformance target identifier</termRef> using a fragment
				identifier (similar to an IEPD artifact URI) per this rule:</p>

			<ruleSection>
				<title>Conformance Target Identifier</title>
				<rule id="r-iep-ct-uri" applicability="IEPD-catalog" class="Interpretation">
					<p>A <termRef>conformance target identifier</termRef> for an <termRef>IEP
							conformance target</termRef> declared in an IEPD is formed by
						concatenating in sequence:</p>
					<ol>
						<li>
							<p>the IEPD URI, and</p>
						</li>
						<li>
							<p>the pound sign character (#). and</p>
						</li>
						<li>
							<p>a locally unique NCName (i.e., a non-colonized name, as defined by
									<ref idref="W3-XML-Schema-Datatypes"/>, <a
									href="http://www.w3.org/TR/2004/REC-xmlschema-2-20041028/datatypes.html#NCName"
										><char name="sect"/>3.3.7, <q>NCName</q></a>).</p>
						</li>
					</ol>
				</rule>
				<p>This rule requires that an <termRef>IEP conformance target</termRef> has a URI,
					i.e., its <termRef>conformance target identifier</termRef>.</p>
			</ruleSection>

			<p>The following rule is required for an <termRef>IEPD catalog document</termRef>. It
				supplements the rule above.</p>

			<ruleSection>
				<title>IEP Conformance Target Has a <qName>structures:id</qName></title>
				<rule id="iep-conformance-target-id" applicability="IEPD-catalog" class="Constraint">
					<p>A <qName>c:IEPConformanceTarget</qName> element MUST own a
							<qName>structures:id</qName> attribute.</p>
				</rule>
				<p>This rule ensures that a <termRef>conformance target</termRef> can be referenced
					between IEPDs (not just within an IEPD). The value of the
						<qName>structures:id</qName> attribute is the NCName in <ref
						idref="r-iep-ct-uri"/>.</p>
			</ruleSection>

			<p>An <termRef term="information exchange package documentation">IEPD</termRef> defines
				IEP conformance targets by explicitly declaring them within its IEPD catalog per the
				rules above.</p>

			<ruleSection>
				<title><termRef term="information exchange package documentation">IEPD</termRef>
					Declares One or More IEP Conformance Targets</title>
				<rule id="validity-constraints" applicability="IEPD" class="Constraint">
					<p>The <termRef>IEPD catalog document</termRef> of an <termRef
							term="information exchange package documentation">IEPD</termRef> MUST
						contain one or more <qName>c:IEPConformanceTarget</qName> elements.</p>
				</rule>
			</ruleSection>

			<p>The following subsections detail the concepts, artifacts, and procedures for
				declaring and identifying <termRef term="IEP conformance target">IEP conformance
					targets</termRef> in IEPDs.</p>



			<section id="Validity-Context-Constraints">
				<title>Validity Context and Constraints</title>

				<p>Explicit declaration of validity constraints is far more flexible and precise
					than relying on conventions that can easily be misinterpreted. The
						<qName>c:IEPConformanceTarget</qName> element within the <termRef>IEPD
						catalog document</termRef> can apply several common constraints by
					explicitly declaring the information required for a given constraint. This
					information may include the conformance target, context, and type of validation,
					location of validation artifact(s), and specific tests to perform. It can also
					identify IEP samples known to satisfy the validity constraints.</p>

				<p><ref idref="IEPD-Catalog-XSD"/> provides XML elements for various validity
					constraints. These constraints are employed by element substitution using two
					abstract elements, <qName>c:ValidityConstraintWithContext</qName> and
						<qName>c:ValidityConstraint</qName>. <ref idref="IEPD-Catalog-XSD"/>
					normatively specifies how this works.</p>

				<p>Note that there may exist multiple ways to declare the same validity constraint
					with these elements. This rule only requires that each required validity
					constraint be declared once in a single form. For example, it may be possible to
					use either <qName>c:HasDocumentElement</qName> and <qName>c:ValidToXPath</qName>
					to declare the same XML document elements. However, it is only required that an
						<termRef term="information exchange package documentation">IEPD</termRef>
					author use one or the other.</p>

				<definition term="validity constraint context">
					<p>A set of information items that establishes the applicability of certain
						validity constraints.</p>
				</definition>

				<p>Validity constraint context can refer to multiple information items (e.g., XML
					elements, attributes, etc.) within an IEP. Also, note that <termRef>validity
						constraint context</termRef> can evaluate to no information items (e.g., in
					XPath, <q><code>()</code></q>, for which <q><code>empty-sequence()</code></q> is
					true). In this cases, the validity constraints (within the in scope validity
					constraint context) will not fire and the test passes.</p>

				<p>The following subsections explain in more detail the purpose and context for
					validity constraints that can be declared in
						<qName>c:IEPConformanceTarget</qName>.</p>

			</section>



			<section id="Declaring-Validity-Constraints">
				<title>Declaring Validity Constraints</title>



				<section id="ValidityConstraintWithContext">
					<title>c:ValidityConstraintWithContext</title>

					<p><qName>c:ValidityConstraintWithContext</qName> is an abstract element into
						which various validity constraints will be substituted, depending upon the
						IEPD author<char name="rsquo"/>s intent. In the absence of an explicit
						context (declared by an <qName>c:xPathText</qName> attribute),
							<termRef>validity constraint context</termRef> defaults to the IEP<char
							name="rsquo"/>s <em>document information item</em> as defined in <ref
							idref="W3-XML-InfoSet"/>, <a
							href="http://www.w3.org/TR/2004/REC-xml-infoset-20040204/#infoitem.document">
							<char name="sect"/>2.1, <q>The Document Information Item</q></a>. In
						this default case, a specific validity constraint will substitute for
							<qName>c:ValidityConstraint</qName> which in turn, substitutes for
							<qName>c:ValidityConstraintWithContext</qName>.</p>

				</section>


				<section id="ValidityConstraint">
					<title>c:ValidityConstraint</title>

					<p>This is the abstract element for which a specific validity constraint will
						substitute if no explicit context is used (and therefore, the default
							<em>document</em> context applies as described in <ref
							idref="ValidityConstraintWithContext"/>).</p>

				</section>


				<section id="ValidityContext">
					<title>c:ValidityContext</title>

					<p><termRef term="validity constraint context">Validity constraint
							context</termRef> is explicitly declared by an XPath expression that is
						the value of <qName>c:xPathText</qName>. <qName>c:ValidityContext</qName>
						can contain any of the specific validity constraints that are substitutable
						for <qName>c:ValidityConstraint</qName>.</p>

					<ruleSection>
						<title>Validity contraint context is value of
							<qName>c:xPathText</qName></title>
						<rule applicability="IEPD-catalog" class="Interpretation">
							<p>Given a <qName>c:xPathText</qName> attribute owned by
									<qName>c:ValidityContext</qName>, the <termRef>validity
									constraint context</termRef> for the descendant<char
									name="rsquo"/>s validity constraint SHALL be the value of
									<qName>c:xPathText</qName> evaluated against the IEP<char
									name="rsquo"/>s document information item (See <ref
									idref="W3-XML-InfoSet"/>, <a
									href="http://www.w3.org/TR/2004/REC-xml-infoset-20040204/#infoitem.document">
									<char name="sect"/>2.1, <q>The Document Information
								Item</q></a>).</p>
						</rule>
					</ruleSection>

				</section>


				<section id="HasDocumentElement">
					<title>c:HasDocumentElement</title>

					<p><qName>c:HasDocumentElement</qName> is a validity constraint that identifies
						all intended XML document elements for an IEP conformance target, and it is
						directly substitutable for <qName>c:ValidityConstraintWithContext</qName>.
						This constraint ensures that an IEP artifact is rooted by one XML document
						element that is a member of the list of elements in its
							<qName>c:qualifiedNameList</qName> attribute. This is a common validity
						constraint employed by simple IEPDs that declare one or more intended XML
						document elements.</p>

					<p>Note that <termRef>validity constraint context</termRef> of
							<qName>c:HasDocumentElement</qName> is always on the IEP<char
							name="rsquo"/>s <em>document information item</em> as defined in <ref
							idref="W3-XML-InfoSet"/>, <a
							href="http://www.w3.org/TR/2004/REC-xml-infoset-20040204/#infoitem.document">
							<char name="sect"/>2.1, <q>The Document Information Item</q></a>. This
						is because it can only declare XML document elements. So, if an IEP defines
						a payload that may be included in some XML envelope, then
							<qName>c:HasDocumentElement</qName> should not be used. Instead, use
							<qName>c:ValidityContext</qName> with another specific validity
						constraint and <qName>c:xPathText</qName> to explicitly declare
							<termRef>validity constraint context</termRef>.</p>

					<p>When employing <qName>c:HasDocumentElement</qName> the following rule
						applies:</p>

					<ruleSection>
						<title>IEP has Document Element</title>
						<rule id="i2" applicability="IEP" class="Constraint">
							<p>Within an IEPD catalog document, if an
									<qName>c:IEPConformanceTarget</qName> element for an IEP has a
									<qName>c:HasDocumentElement</qName> child element owning a
									<qName>c:qualifiedNameList</qName> attribute with a value of
									<code>$LIST</code>, then the document element of the IEP MUST
								have a <em>QName</em> that is a member of <code>$LIST</code>.</p>
						</rule>
					</ruleSection>

				</section>



				<section id="ValidToXPath">
					<title>c:ValidToXPath</title>

					<p><qName>c:ValidToXPath</qName> is a specific validity constraint whose purpose
						is to ensure that a condition is satisfied within an IEP. The condition is
						defined by an XPath expression contained in the <qName>c:xPathText</qName>
						attribute. If the XPath expression applied to a target instance <termRef>XML
							document</termRef> returns a Boolean value of TRUE, then the condition
						is satisfied by that XML document.</p>

					<p>This validity constraint is useful for a variety of purposes. For example, an
							<termRef term="information exchange package documentation"
							>IEPD</termRef> author may require that a given
							<qName>c:IEPConformanceTarget</qName> must contain a particular element
						with a particular attribute whose value is an integer greater than some
						required minimum. An XPath expression can validate this.</p>

					<p><qName>c:ValidToXPath</qName> can also employ a simple XPath expression to
						validate that an IEP is rooted with an intended XML document element.
						However, other validity constraints can do this as well; the <termRef
							term="information exchange package documentation">IEPD</termRef> author
						may choose the constraint representation.</p>

					<p>Note that if <qName>c:ValidToXPath</qName> is used (substituted) within
							<qName>c:ValidityContext</qName> there will be two XPath expressions
							<char name="mdash"/> the expression within <qName>c:ValidToXPath</qName>
						is the condition to validate, the other is the context (where the condition
						will be validated). For example, the context provided by
							<qName>c:ValidityContext</qName> might be
							<code>//my:speedingTicket</code>, while the
							<qName>c:ValidToXPath</qName> might require that a test for
							<code>exists(nc:DriverPerson)</code> be true.</p>

					<p>This specific validity constraint as well as those that follow below can
						either be substituted for the <qName>c:ValidityConstraint</qName> or used
						within the <qName>c:ValidityContext</qName> element (i.e., substituted for
						its <qName>c:ValidityConstraint</qName> child).</p>

					<p>Note that if <qName>c:ValidToXPath</qName> is substituted for
							<qName>c:ValidityConstraint</qName> within the
							<qName>c:ValidityContext</qName> element, then the explicit context, the
							<qName>c:xPathText</qName> value, can imply that multiple items must be
						checked and each must return "true" in order for an IEP to pass the
							<qName>c:ValidToXPath</qName> constraint.</p>

					<p>When employing <qName>c:ValidToXPath</qName> the following rule applies:</p>

					<ruleSection>
						<title>Validating an XPath Expression</title>
						<rule id="i1" applicability="IEP" class="Constraint">
							<p>Within an <termRef>IEPD catalog document</termRef> with a
									<qName>c:xPathText</qName> attribute owned by a
									<qName>c:ValidToXPath</qName> element, a candidate IEP is a
								valid IEP, ONLY IF the value of <qName>c:ValidToXPath</qName>
								applied to the candidate IEP (an <termRef>XML document</termRef>)
								has an effective Boolean value (EBV) equal to <code>true</code>. EBV
								is defined by <ref idref="W3-XPath"/>, <a
									href="http://www.w3.org/TR/2010/REC-xpath20-20101214/#id-ebv">
									<char name="sect"/>2.4.3, <q>Effective Boolean
								Value</q></a>.</p>
						</rule>
					</ruleSection>

				</section>


				<section id="XMLSchemaValid">
					<title>c:XMLSchemaValid</title>

					<p>NIEM employs the W3C XML Schema Definition (XSD) Language (<ref
							idref="W3-XML-Schema-Structures"/> and <ref
							idref="W3-XML-Schema-Datatypes"/>), one of several XML schema definition
						languages designed to define an instance XML document and enable its
						validation. In general, an instance XML document is valid against a
						particular XML schema if it obeys or conforms to the constraints imposed by
						that schema (<ref idref="W3-XML-Schema-Structures"/>, <a
							href="http://www.w3.org/TR/xmlschema11-1/#sec-schema-validity-and-docs">
							<char name="sect"/>2.5, <q>Schema-validity and documents</q></a>).</p>

					<p>So, a NIEM <termRef term="information exchange package documentation"
							>IEPD</termRef> is an IEPD that contains a set of XML schema documents,
						that are assembled into an XML schema (after processing XML catalogs to
							<termRef>resolve URI</termRef> values in namespace attributes owned by
							<qName>xs:import</qName> elements and similar XML Schema constructs). In
						turn, the resulting XML schema can be used to validate one or more <termRef
							term="instance XML document">instance XML documents</termRef> for NIEM
						conformance.</p>

					<p>NIEM is based on XML Schema, and so the term "schema validation" usually
						refers to "XML Schema validation". However, an <termRef
							term="information exchange package documentation">IEPD</termRef> author
						may also choose to include artifacts to validate with other types of schemas
						or rules, including but not limited to <ref idref="ISO-Schematron"/> and
							<ref idref="ISO-RelaxNG"/>. <termRef
							term="information exchange package documentation">IEPD</termRef> authors
						may also include artifacts for NIEM constraint schema validation, which, of
						course, is XML Schema validation (See <ref idref="Constraint-Schemas"/>.</p>

					<p>Because NIEM is XML Schema based, then <qName>c:XMLSchemaValid</qName> (of
						type <qName>c:XMLSchemaType</qName>) will likely be employed by most IEPDs.
						This validity constraint ensures that an IEP artifact is schema valid to an
						XML schema that can be assembled correctly from the schema documents that
						comprise it. To do this <qName>c:XMLSchemaValid</qName> provides two methods
						to choose from based on its child elements, <qName>c:XMLCatalog</qName> and
							<qName>c:XMLSchemaDocument</qName>, both zero to unbounded cardinality.
						The IEPD author can use (1) <qName>c:XMLCatalog</qName> to identify one or
						more XML catalog documents that map the correct schema documents; or (2)
							<qName>c:XMLSchemaDocument</qName> to explicitly identify the one or
						more XML schema documents to be retrieved. In each case, depending on the
						nature of the XML schema document set from which the schema documents are
						coming, it may be possible to identify a single XML catalog document or a
						single XML schema document. That catalog or schema document will be the
						starting point or root document and will contain enough information to
						explicitly identify or cascade to the rest. (See also <ref
							idref="XML-Catalogs"/>)</p>

					<p>It is the IEPD author<char name="rsquo"/>s responsibility to ensure that the
						method used (XML catalogs or XML schema document identification) is
						configured correctly per the appropriate specification (<ref
							idref="OASIS-XML-Catalogs"/> or <ref idref="W3-XML-Schema-Structures"
						/>).</p>

				</section>


				<section id="SchematronValid">
					<title>c:SchematronValid</title>

					<p><qName>c:SchematronValid</qName> is similar to
							<qName>c:XMLSchemaValid</qName>, but uses a
							<qName>c:SchematronSchema</qName> element to identify the Schematron
						rule file that applies to the IEP.</p>
				</section>


				<section id="RelaxNGValid">
					<title>c:RelaxNGValid</title>

					<p><qName>c:RelaxNGValid</qName> is similar to the previous two validity
						constraints, but uses a <qName>c:RelaxNGSchema</qName> element to identify
						the RelaxNG schema file to which the IEP must validate.</p>
				</section>


				<section id="ConformsToConformanceTarget">
					<title>c:ConformsToConformanceTarget</title>

					<p><qName>c:ConformsToConformanceTarget</qName> enables an <termRef
							term="information exchange package documentation">IEPD</termRef> author
						to effectively subclass and relate conformance target classes. For example,
						using this constraint, a given conformance target class defined by a
							<qName>c:IEPConformanceTarget</qName>
						<code>structures:id="A2"</code> can be required to also conform to another
						class <code>structures:id="A1"</code>. This creates an <em>IS-A</em>
						relationship. We say that <code>A2</code>
						<em>IS-AN</em>
						<code>A1</code>, or that <code>A2</code>
						<em>IS-A</em> specialization of <code>A1</code>.</p>

					<p>Conformance target classes are related through the
							<qName>c:conformanceTargetURI</qName> attribute owned by
							<qName>c:ConformsToConformanceTarget</qName>. Recall that per <ref
							idref="r-iep-ct-uri"/> a conformance target URI is formed by
						concatenating the <termRef term="information exchange package documentation"
							>IEPD</termRef> URI (the value of <qName>c:iepdURI</qName>), the pound
						character (<code>"#"</code>), and the value of the conformance class
							(<qName>structures:id</qName>) of the <termRef>IEP conformance
							target</termRef>.</p>

				</section>


				<section id="ConformsToRule">
					<title>c:ConformsToRule</title>

					<p>Sometimes it is not possible to formally declare an executable validity
						constraint. For example, we can mandate that a <termRef>data
							component</termRef> definition must be present, must be in English, and
						must follow <ref idref="ISO-11179-4"/>. Validating that text is present is
						easy, and validating that it is in English is more difficult, but validating
						that it obeys <ref idref="ISO-11179-4"/> is essentially intractable. Thus,
							<qName>c:ConformsToRule</qName> provides an <termRef
							term="information exchange package documentation">IEPD</termRef> author
						with English text representation as an alternative when it is not possible
						or not easy to define more formal validation rules or validity
						constraints.</p>

				</section>
			</section>



			<section id="IEP-Samples">
				<title>IEP Sample Instance XML Documents</title>

				<p>This section discusses sample IEPs in the context of an <termRef
						term="information exchange package documentation">IEPD</termRef>. However,
					this is not meant to imply that sample IEPs are not useful in other IEPDs.</p>

				<p>A sample IEP <termRef>instance XML document</termRef> is a representation of an
					actual or example exchange data instance. Sample instances can be extremely
					valuable artifacts in an <termRef
						term="information exchange package documentation">IEPD</termRef>. Sample
					IEPs:</p>
				<ul>
					<li>
						<p>Help an <termRef term="information exchange package documentation"
								>IEPD</termRef> implementer to understand the original intent of the
								<termRef term="information exchange package documentation"
								>IEPD</termRef> author.</p>
					</li>
					<li>
						<p>Can be used by an implementer as a data point for validation of IEP
							conformance targets.</p>
					</li>
					<li>
						<p>can indicate or imply <termRef
								term="information exchange package documentation">IEPD</termRef>
							quality.</p>
					</li>
				</ul>

				<p>For these reasons, the following rule applies to an <termRef
						term="information exchange package documentation">IEPD</termRef>:</p>

				<ruleSection>
					<title>IEPD Has an IEP Sample for Each
						<qName>c:IEPConformanceTarget</qName></title>
					<rule id="r-iep-samples" applicability="IEPD" class="Constraint">
						<p>Within the IEPD catalog document of an <termRef
								term="information exchange package documentation">IEPD</termRef>, a
								<qName>c:IEPConformanceTarget</qName> element MUST contain a
								<qName>c:IEPSampleXMLDocument</qName> child element.</p>
					</rule>
				</ruleSection>

				<p>The rule above requires that each declared <termRef>IEP conformance
						target</termRef> be covered (exemplified or correctly demonstrated) by at
					least one IEP sample instance XML document. This does not necessarily mandate a
					different IEP sample for each <termRef>IEP conformance target</termRef>. It may
					be possible, and is therefore acceptable, for a given IEP sample to serve as an
					example of one or more <termRef term="IEP conformance target">IEP conformance
						targets</termRef>.</p>

				<p>The purpose of this rule is not to provide a test for all possible IEP
					permutations given the schema definitions and validity constraint declarations;
					rather, it is to encourage <termRef
						term="information exchange package documentation">IEPD</termRef> authors to
					test their own designs, and to provide implementers with examples for additional
					understanding, guidance, and testing. To the extent possible, <termRef
						term="information exchange package documentation">IEPD</termRef> authors
					should strive to include sample IEPs that (1) capture real world business cases
					of data exchanges, and (2) exercise as many <termRef term="data component">data
						components</termRef> and validity constraints as possible. Where it makes
					sense, an <termRef term="information exchange package documentation"
						>IEPD</termRef> author should strive to provide enough sample IEPs to
					exercise all the XML document elements (or payload root elements). If a single
					IEP cannot provide enough example coverage, an author may include multiple IEPs
					(but is not required to do so).</p>

				<p>Each sample IEP usually illustrates a single view of the data based on a chosen
					set of conditions. Other views based on different conditions likely exist. An
					implementer will still need to review the <termRef
						term="information exchange package documentation">IEPD</termRef>
					documentation to ensure understanding of all potential conditions. Therefore, as
					appropriate, the author should not rely exclusively on sample IEPs to convey
					implementation understanding, since they will probably not account for all
					possible permutations.</p>

				<p>The following rule relates to validity of an IEP Sample XML Document:</p>

				<ruleSection>
					<title>Validating an IEP Sample XML Document</title>
					<rule id="i3" applicability="IEP" class="Constraint">
						<p>Within an <termRef>IEPD catalog document</termRef> with a
								<qName>c:pathURI</qName> attribute owned by a
								<qName>c:IEPSampleXMLDocument</qName>, the artifact resolved by the
							value of <qName>c:pathURI</qName> MUST be valid for the validity
							constraints of the <qName>c:IEPConformanceTarget</qName> parent of
								<qName>c:IEPSampleXMLDocument</qName>.</p>
					</rule>
				</ruleSection>

			</section>
		</section>


		<!-- ########################## Conformance Assertion ############################## -->


		<section id="Conformance-Assertion">
			<title>Conformance Assertion</title>

			<p>Independent authors build NIEM IEPDs from NIEM <termRef
					term="reference schema document set">reference schema document sets</termRef>.
				Presently, a formal NIEM conformance certification process for IEPDs does not exist.
				Therefore, this specification requires that an <termRef
					term="information exchange package documentation">IEPD</termRef> contain an
				artifact that asserts NIEM conformance and provides a small amount of information to
				support such.</p>

			<definition term="conformance assertion">
				<p>An artifact that provides a declaration that an IEPD conforms to relevant NIEM
					specifications and associated rules, including <ref idref="NIEM-Conformance"/>,
						<ref idref="NIEM-NDR"/>, <ref idref="NIEM-CTAS"/> and this NIEM IEPD
					Specification.</p>
			</definition>

			<ruleSection>
				<title>IEPD Has Conformance Assertion</title>
				<rule id="r1-conform-assert" applicability="IEPD" class="Constraint">
					<p>An <termRef term="information exchange package documentation">IEPD</termRef>
						MUST contain a <termRef>conformance assertion</termRef> artifact that is
						identified by a <qName>c:ConformanceAssertion</qName> element in its
							<termRef>IEPD catalog document</termRef>.</p>
				</rule>
			</ruleSection>

			<p>A <termRef>conformance assertion</termRef> provides information to increase the level
				of confidence that an <termRef term="information exchange package documentation"
					>IEPD</termRef> was checked for NIEM conformance and quality. It does NOT
				constitute a guarantee or contract. In fact, a conformance assertion can be
				self-asserted.</p>

			<p>In the absence of a formal NIEM certification process, both weak and strong
				conformance assertions will exist. <termRef
					term="information exchange package documentation">IEPD</termRef> users or
				implementers (who are not the author) must decide their level of confidence in the
				assertion. A self-signed artifact that simply claims an <termRef
					term="information exchange package documentation">IEPD</termRef> is
				NIEM-conformant may be considered weak. On the other hand, a stronger self-assertion
				could provide information that may include (but is not limited to):</p>
			<ul>
				<li>
					<p>Date of assertion</p>
				</li>
				<li>
					<p>URI of the IEPD claiming NIEM conformance</p>
				</li>
				<li>
					<p>Assertion of NIEM conformance</p>
				</li>
				<li>
					<p>Author (name and/or organization, or sponsoring entity; indication of NIEM
						and XML background or experience)</p>
				</li>
				<li>
					<p>Certifier (may be the author or another person/organization)</p>
				</li>
				<li>
					<p>Details of conformance verification:</p>
					<ul>
						<li>
							<p>How, what, and/or who? (e.g., automatic checks, manual checks, other
								reviews?)</p>
						</li>
						<li>
							<p>Tool(s) employed? (e.g., tool, version, how used, on what, etc.)</p>
						</li>
						<li>
							<p>Results? (e.g., issues, pass/fails, warnings, confirmations,
								etc.)</p>
						</li>
					</ul>
				</li>
			</ul>

			<p>Inclusion of a <termRef>conformance assertion</termRef> made by a reputable,
				independent, trusted entity (person or organization) would likely increase
				confidence in conformance. Another strong case can be made by supplementing a
				conformance assertion with a formal conformance test report or similar artifact. The
				IEPD catalog schema document provides a <qName>c:ConformanceReport</qName> element
				to identify a conformance report if one is present. A sample <termRef>conformance assertion</termRef>, <ref idref="Conformance-Assertion-Example"/> is included in this specification.</p>

			<p>In the future, as NIEM procedures and tools advance, a conformance or quality report
				and a corresponding certificate may become required artifacts. A tool might check
				conformance and issue the report and certificate together as a digitally signed and
				hashed artifact that reports conformance, and proves both author and <termRef
					term="information exchange package documentation">IEPD</termRef> identity (i.e.,
				that the <termRef term="information exchange package documentation">IEPD</termRef>
				is an unaltered copy of the original). For now, inclusion of an informal
					<termRef>conformance assertion</termRef> artifact in an <termRef
					term="information exchange package documentation">IEPD</termRef> is the only
				requirement.</p>

		</section>
	</section>


	<!-- ###################### Optional IEPD Artifacts ############################ -->


	<section id="Optional-IEPD-Artifacts">
		<title>Optional IEPD Artifacts</title>

		<p>Aside from the required artifacts, IEPD content is relatively flexible. A variety of
			other optional documentation files may be incorporated into an IEPD. When applicable,
			these may include (but are not limited to) files that describe or explain:</p>
		<ul>
			<li>
				<p>Implementation details (hardware, software, configuration, etc.)</p>
			</li>
			<li>
				<p>Use of multiple root elements</p>
			</li>
			<li>
				<p>Use of multiple subsets or mixed releases</p>
			</li>
			<li>
				<p>How to use/reuse an IEPD for various purposes (such as Web Services)</p>
			</li>
			<li>
				<p>Rationales and/or business purposes</p>
			</li>
		</ul>

		<p>In addition to documentation artifacts, a variety of other optional files can be added to
			an IEPD to facilitate tool support and make reuse, adaptation, and/or implementation
			easier. These are often files that are inputs to or outputs from software tools.
			Examples include content diagrams, content models in tool-specific formats, and business
			rules (either formal or informal representations).</p>

		<p>An IEPD author may include any files believed to be useful to understand, implement,
			reuse, and/or adapt an IEPD.</p>

		<p>An IEPD of relatively simple content and scope may only need to contain the minimum
			mandatory artifacts required by this specification in order to understand and implement
			it. (See <ref idref="IEPD-Artifacts"/> for a listing of the mandatory and common
			optional artifacts for each type of IEPD.)</p>

		<p>Files vary widely in format and are often specific to the tools an author uses to parse,
			consume, or output them. Therefore, if tool-specific files are included in an IEPD, it
			is also a good practice to include copies of those files in formats that display with
			standard Web browsers or other cost-free, publicly available viewing tools (e.g., ASCII
			text, PDF, CSV, HTML, JPG, GIF, PNG). This guidance is intended to encourage and
			facilitate maximal sharing and distribution of IEPDs; it does not prohibit and is not
			intended to discourage the inclusion of other file formats.</p>

		<p>In particular, this specification does not discourage use of Microsoft file formats for
			documentation and other optional artifacts. Microsoft Office products are in common use,
			and free viewers are available for many of them (See
				<link>https://www.microsoft.com/en-us/microsoft-365/microsoft-office</link>).</p>



		<section id="Wantlists">
			<title>NIEM Wantlist</title>

			<p>A NIEM schema document subset is often associated with a NIEM <em>wantlist</em>. A
					<em>wantlist</em> is an abbreviated XML representation of a NIEM schema document
				subset, and identifies only the <termRef term="data component">data
					components</termRef> a user selected (as requirements) to build a schema
				document subset. To reconstruct the complete schema document subset there are
				usually a number of additional <termRef term="data component">data
					components</termRef> that the user selections depend upon. These must be
				computed from the appropriate NIEM reference model and added to reconstruct the
				complete schema document subset. For example, a user may select
					<qName>nc:Person</qName> for the subset. In this case, the wantlist will only
				contain that component, but the associated full subset must contain both
					<qName>nc:Person</qName> and <qName>nc:PersonType</qName>. A software tool that
				understands how to process NIEM wantlists and schema document subsets (such as the
				NIEM Schema Subset Generator Tool <ref idref="NIEM-SSGT"/>) can rebuild an accurate
				schema document subset from a wantlist (and the reverse).</p>

			<definition term="NIEM wantlist">
				<p>An XML document that represents a complete NIEM schema document subset.</p>
			</definition>

			<p>A NIEM wantlist identifies the <termRef>data component</termRef> requirements
				declared by the subset author; it does not identify the <termRef>data
					component</termRef> dependencies required to reconstitute the complete subset.
				The complete subset can be computed with the reference schema document set from
				which the subset was derived.</p>

			<p>A wantlist is always associated with a schema document subset. A wantlist may also be
				associated with a <termRef>constraint schema document set</termRef>, because
				constraint schema documents are often built from a <termRef>schema document
					subset</termRef>. For a simple <termRef
					term="information exchange package documentation">IEPD</termRef>, it can
				sometimes be trivial to identify a single schema document subset. However, this IEPD
				Specification does not prohibit building complex IEPDs that contain schema document
				sets supported by multiple schema document subsets and associated wantlists. As with
				other complex cases, the <termRef term="information exchange package documentation"
					>IEPD</termRef> author is responsible to clearly document the associations
				between wantlists and schema document sets. In order to maintain a minimal degree of
				consistency for placement of a wantlist within an <termRef
					term="information exchange package documentation">IEPD</termRef> the following
				rule applies.</p>

			<ruleSection>
				<title>Wantlist Location</title>
				<rule id="r-wantlist-base" applicability="WF-IEPD" class="Constraint">
					<p>If present, a NIEM wantlist MUST reside within the root of the IEPD
						subdirectory that groups and defines its corresponding subset schema
						document set (e.g., <code>niem</code>).</p>
				</rule>
			</ruleSection>

		</section>



		<section id="Business-Rules">
			<title>Business Rules</title>

			<p>For simplicity and consistency, NIEM employs a profile of the XML Schema language
					<ref idref="W3-XML-Schema-Structures"/>, <ref idref="W3-XML-Schema-Datatypes"/>.
				Thus, some constraints on NIEM XML documents cannot be enforced by NIEM. <termRef
					term="constraint schema document set">Constraint schema document sets</termRef>
				provide a convenient technique for enforcing some additional constraints. However,
				even the full XML Schema language cannot validate and enforce all possible
				constraints that may be required of an XML document.</p>

			<p>So, NIEM allows (even encourages) the use of formal or informal <termRef>business
					rules</termRef> to help define or constrain IEPDs.</p>

			<definition term="business rules">
				<p>Formal or informal statements that describe business policy or procedure, and in
					doing so define or constrain some aspect of a process or procedure in order to
					impose control.</p>
			</definition>

			<p><termRef term="business rules">Business rules</termRef> may be represented as
				informal English statements, or as formally coded machine-readable and process-able
				statements. For example, an <termRef
					term="information exchange package documentation">IEPD</termRef> may use a
					<termRef>Schematron schema</termRef>
				<ref idref="ISO-Schematron"/> or any other formal representation for
					<termRef>business rules</termRef>.</p>

			<definition term="business rule schema">
				<p>An artifact that contains <termRef>business rules</termRef> in a formal
					representation language with the intent to automatically process them on an XML
					document to enforce business constraints.</p>
			</definition>

			<definition term="Schematron schema">
				<p>A <termRef>business rule schema</termRef> that adheres to <ref
						idref="ISO-Schematron"/>.</p>
			</definition>

		</section>
	</section>


	<!-- ###################### Organization, Packaging, Other Criteria ############################ -->


	<section id="Organization-Packaging-Other-Criteria">
		<title>Organization, Packaging, and Other Criteria</title>

		<p>An IEPD is a logical set of electronic files aggregated and organized to fulfill a
			specific purpose in NIEM. Directory organization and packaging of an IEPD should be
			designed around major themes in NIEM: reuse, sharing, interoperability, and
			efficiency.</p>

		<ruleSection>
			<title>An IEPD in ZIP File Format Preserves Logical Directory Structure.</title>
			<rule id="r-iepd-archive" applicability="WF-IEPD" class="Constraint">
				<p>An IEPD in <termRef>ZIP file</termRef> format represents a sub-tree of a file
					system. Such an archive MUST preserve and store the logical directory structure
					intended by its author for respository format.</p>
			</rule>
		</ruleSection>

		<p>NIEM XSD and XML <termRef term="artifact">artifacts</termRef> in an IEPD must be valid
			for both XML Schema and NIEM. This also implies these artifacts must adhere to
			applicable <ref idref="NIEM-NDR"/> conformance target rules.</p>

		<ruleSection>
			<title>XSD and XML Documents Conform to Applicable NDR Conformance Targets</title>
			<rule id="r-iepd-conform-tgts" applicability="WF-IEPD" class="Constraint">
				<p>Within an IEPD, each XML schema document (XSD) or instance XML document (XML)
					artifact that uses a conformance targets attribute (as defined by <ref
						idref="NIEM-CTAS"/>) MUST satisfy the <ref idref="NIEM-NDR"/> rules for the
					conformance targets it declares.</p>
			</rule>
		</ruleSection>

			<p>There are many ways to organize <termRef
					term="information exchange package documentation">IEPD</termRef> directories that
					may depend on a number of factors including (not limited to) business purpose and
					complexity. For this reason, strict rules for <termRef
						term="information exchange package documentation">IEPD</termRef> directory structure
					are difficult to establish. Therefore, <termRef
						term="information exchange package documentation">IEPD</termRef> authors may create
					their own logical directory structures subject to the rules of this section.</p>

		<definition term="IEPD root directory">
			<p>The top level file directory relative to all IEPD artifacts and subdirectories.</p>
		</definition>

		<ruleSection>
			<title>IEPD Archive Uncompresses to a Single Root Directory</title>
			<rule id="r-iepd-archive-one-root" applicability="WF-IEPD" class="Constraint">
				<p>An IEPD in <termRef>ZIP file</termRef> format MUST uncompress (unzip) to one and
					only one <termRef>IEPD root directory</termRef>.</p>
			</rule>
		</ruleSection>

		<p>The foregoing rule ensures that:</p>
		<ul>
			<li>
				<p>Unpacking an IEPD in <termRef>ZIP file</termRef> format will not scatter its
					contents on a storage device.</p>
			</li>
			<li>
				<p>One common starting directory always exists to explore or use any IEPD.</p>
			</li>
			<li>
				<p>iepd-catalog and change log artifacts will always be found in the <termRef>IEPD
						root directory</termRef>.</p>
			</li>
		</ul>



		<section id="Artifact-Sets">
			<title>Artifact Sets</title>

			<p>Grouping artifacts into sets is generally optional. There may be many reasons for
				identifying artifacts sets in an IEPD. While directory structure is most often the
				most convenient method for grouping a set of artifacts, there may multiple logical
				groupings, and these may spread across multiple directories.</p>

			<p>This specification defines other ways to group IEPD artifacts into <termRef
					term="artifact set">sets</termRef>. In general, independent of directory
				organization, sets can be established through one of two methods. An <termRef>XML
					catalog document</termRef> can be used to establish an <termRef>XML schema
					document</termRef> set. The <termRef>IEPD catalog document</termRef> can be used
				to identify all kinds of artifacts sets (including XML schema documents).</p>

			<p><ref idref="XML-Catalogs"/> describes how NIEM employs an <termRef>XML catalog
				document</termRef> to assemble an <termRef>XML Schema</termRef> from <termRef
					term="XML schema document">XML schema documents</termRef>. This method is applicable to all the
				various classes of NIEM XML schema documents (reference, subset, extension,
				constraint, and external).</p>

			<p>Another reason for grouping artifacts into sets is a need for humans to review,
				identify, and navigate the artifacts of an <termRef
					term="information exchange package documentation">IEPD</termRef> (particularly,
				if it is complicated). An <termRef>XML catalog document</termRef> has a relatively
				focused purpose, to identify (by namespace) and assemble a set of XML schema
				documents into an <termRef>XML Schema</termRef>. It is not intended to index
				artifacts in general (other than XML schema documents to assigned target
				namespaces). So, it does not classify or describe the artifacts it identifies.</p>

			<p>On the other hand, the <termRef>IEPD catalog document</termRef> is designed to
				record, index, classify, and describe (as needed) any or all IEPD artifacts (not
				just schema documents). The IEPD catalog provides a flexible method for grouping all
				kinds artifacts.</p>

			<p>The IEPD catalog schema <ref idref="IEPD-Catalog-XSD"/> defines a set of common
				artifact classifiers and artifact set classifiers. In summary, per <ref
					idref="IEPD-Catalog-XSD"/>, define sets by substituting the appropriate artifact
				classifier (of type <qName>c:FileType</qName>) into the abstract element
					<qName>c:ArtifactOrArtifactSet</qName>, within the appropriate artifact set
				classifier (of type <qName>c:FileSetType</qName>). Use the most specific classifiers
				available for your artifacts and artifact sets. Otherwise, as needed, use generic
					<qName>c:File</qName> and <qName>c:FileSet</qName> classifiers with
					<qName>nc:DescriptionText</qName>.</p>

			<p>Note that the <qName>c:pathURI</qName> value for an artifact is its operating system
				relative directory <termRef>path name</termRef> with file name. The
					<qName>c:pathURI</qName> value for an artifact set is its operating system
				relative <termRef>path name</termRef>.</p>

			<p>Artifact sets can be assembled in the IEPD Catalog by using c:FileSet with or without
				a <qName>c:pathURI</qName> attribute.</p>

			<p>If a single directory contains all the artifacts in a set, then the following simple
				form of <qName>c:FileSet</qName> can be used:</p>

			<figure>
				<title>Simple <qName>c:FileSet</qName> form for a directory-associated artifact
					set.</title>
				<pre>
	&lt;c:FileSet c:pathURI="samples/"&gt;
		&lt;nc:DescriptionText&gt;All IEP samples within this IEPD.&lt;/nc:DescriptionText&gt;
	&lt;/c:FileSet&gt;
		</pre>
			</figure>

			<p>This simple form of <qName>c:FileSet</qName> associates an operating system directory
				with a set of artifacts that also includes all artifacts within subdirectories under
				the directory named in the value of the <qName>c:pathURI</qName> attribute. Note
				that the interpretation of this XML schema component (as implied by
					<qName>nc:DescriptionText</qName>) is that all artifacts in the
					<code>samples/</code> directory are sample IEPs, and no other IEP samples exist
				in other locations within the <termRef
					term="information exchange package documentation">IEPD</termRef>. The author
				must construct IEPD catalog entries that are clear and correct. So, in this case, if
				other artifacts exist within this directory that are not sample IEPs or if sample
				IEPs exist in other directories, then use of this simple directory association form
				is not appropriate.</p>

			<p>However, multiple artifact sets and artifacts can be nested within a
					<qName>c:FileSet</qName> element to organize artifacts into a logical group of
				files in many locations. For example, an author may identify a set of artifacts in
				several locations using the following more complicated form of
					<qName>c:FileSet</qName> with the IEPD catalog:</p>

			<figure>
				<title><qName>c:FileSet</qName> form for a more complex artifact set.</title>
				<pre>
	&lt;c:FileSet&gt;
		&lt;nc:DescriptionText&gt;All IEP samples in this IEPD&lt;/nc:DescriptionText&gt;
		&lt;c:FileSet c:pathURI="samples/" /&gt;
		&lt;c:FileSet c:pathURI="iep-samples-1/" /&gt;
		&lt;c:FileSet c:pathURI="iep-samples-2/" /&gt;
		&lt;c:FileSet c:pathURI="iep-samples-supplement/" /&gt;
		&lt;c:IEPSampleXMLDocument c:pathURI="iep/test-case1.xml" c:mimeMediaTypeText="text/xml" /&gt;
		&lt;c:IEPSampleXMLDocument c:pathURI="test/test-case2.xml" c:mimeMediaTypeText="text/xml" /&gt;
	&lt;/c:FileSet&gt;
		</pre>
			</figure>

			<p>Another way the IEPD catalog schema groups artifacts is through the use of the
					<qName>c:RequiredFile</qName> element. Use this construct to signify there are
				strong dependencies among artifacts. For example, documentation may be prepared as a
				set of hyperlinked HTML files. These HTML files may also incorporate separate GIF or
				JPG images. Regardless of file location within the IEPD, these files depend on one
				another through hyperlinks. As a result, they tend to operate as a single artifact;
				removal of a file will cause one or more broken links within the set. This set of
				artifacts should be grouped using <qName>c:RequiredFile</qName>. If the set does not
				have a root HTML document (i.e., the set can be entered from any file in the set),
				then create an index HTML document and use it as the root of the set (i.e., the
				index is the value of the <qName>c:File</qName> element while all others are values
				for <qName>c:RequiredFile</qName> child elements).</p>



			<section id="Constraint-SchemaDocumentSet">
				<title>Constraint on Elements of Type <qName>c:SchemaDocumentSetType</qName></title>

				<p>In order to accommodate the <termRef>information exchange package
						documentation</termRef> concept, the design of the IEPD catalog schema does
					not enforce a rule that is required to ensure a
						<qName>c:SchemaDocumentSet</qName> within an <termRef>IEPD catalog
						document</termRef> is used correctly for an <termRef
						term="information exchange package documentation">IEPD</termRef>. This rule
					assumes that within the IEPD<char name="rsquo"/>s IEPD catalog any
						<qName>c:SchemaDocumentSet</qName> element identifies <termRef
						term="XML schema document">XML schema documents</termRef> to be assembled
					into an <termRef>XML Schema</termRef>.</p>

				<ruleSection>
					<title>Constraint on Elements of Type
						<qName>c:SchemaDocumentSetType</qName></title>
					<rule id="r-constraint-schemadocumentset" applicability="IEPD-catalog"
						class="Constraint">
						<p>An element information item with a type definition validly derived from
								<qName>c:SchemaDocumentSetType</qName> MUST have a child element
							with an element declaration that is in the substitution group of
								<qName>c:XMLCatalog</qName> or
							<qName>c:XMLSchemaDocument</qName>.</p>
					</rule>
					<p>This rule ensures that a <qName>c:SchemaDocumentSet</qName> element always
						has at least one child element that is an <termRef>XML catalog
							document</termRef> (which itself defines an <termRef>XML schema
							document</termRef>) set, or an <termRef>XML schema document</termRef>
						(which constitutes a set of at least one schema document). This rule cannot
						be enforced within the IEPD catalog schema without introducing a UPA error,
						but it could be enforced by a Schematron rule.</p>
				</ruleSection>

			</section>
		</section>



		<section id="IEPD-File-Name-Syntax">
			<title>IEPD File Name Syntax</title>

			<p>Additional non-normative for directory naming and organization for IEPDs is in <ref
					idref="Guidance-IEPD-Directories"/>.</p>

			<p>It is important to understand that this section does not apply to the syntax for the
					<qName>c:iepdName</qName> attribute in the <termRef>IEPD catalog
					document</termRef>. Refer to <ref idref="Name-Syntax"/> for details regarding
				the <qName>c:iepdName</qName> metadata attribute.</p>

			<p>The IEPD Specification is intended to help facilitate tool support for processing
				IEPDs. Tools and search mechanisms that can identify basic IEPD information as early
				as possible is efficient and valuable. So, if an IEPD name, version, and class can
				be identified from its file name, then a tool would not have to open the
					<termRef>ZIP file</termRef> and parse the IEPD catalog to determine such. Of
				course, to do anything useful, a tool will eventually have to open the IEPD archive.
				However, a standard file name syntax allows a tool to search through a set of IEPDs
				in <termRef>ZIP file</termRef> format to find a particular IEPD name, version, or
				class without having to open each. File name consistency can also make it easier to
				scan and identify IEPDs in a long list sorted by file name.</p>

			<ruleSection>
				<title>IEPD ZIP file Name Syntax</title>
				<rule id="r-iepd-name-syntax" applicability="IEPD" class="Constraint">
					<p>The file name of an <termRef
							term="information exchange package documentation">IEPD</termRef>
						<termRef>ZIP file</termRef> (<code>iepd-filename</code>) SHOULD adhere to
						the syntax defined by the regular expression:</p>
					<pre>
	iepd-filename ::= name '-' version '.iepd.zip'
	Where: 
		name     ::= alphanum ((alphanum | special)* alphanum)?
		alphanum ::= [a-z0-9]
		special  ::= '.' | '-' | '_'
		version  ::= digit+ ('.' digit+)* (status digit+)?
		digit    ::= [0-9]
		status   ::= 'alpha' | 'beta' | 'rc' | 'rev'</pre>

					<p>The <code>status</code> values are as defined in <ref
							idref="r-iepd-vers-syntax"/>.</p>
				</rule>
				<p>Regular expression notation in the rule above is from <ref idref="W3-XML"/>
					<link href="http://www.w3.org/TR/2008/REC-xml-20081126/#sec-notation"
						>#sec-notation</link>.</p>
				<p>Alphabetic characters are lower case to reduce complications across various file
					systems.</p>
				<p>An example of an <termRef term="information exchange package documentation"
						>IEPD</termRef> file name that follows this rule is:
						<code>abc-query-2.0beta1.iepd.zip</code></p>
			</ruleSection>

			<p>File names can easily be changed by a person or process that executes a download on
				the Internet. Nonetheless, <termRef
					term="information exchange package documentation">IEPD</termRef> authors and
				publishers should ensure that their application of <ref idref="r-iepd-name-syntax"/>
				is consistent with an IEPD<char name="rsquo"/>s catalog. The basic metadata in the
					<termRef>IEPD catalog document</termRef> (e.g., IEPD name, version, class, URI,
				etc.) should match any such information incorporated into the file name.</p>

		</section>



		<section id="Artifact-Links-to-Other-Resources">
			<title>Artifact Links to Other Resources</title>

			<p>It is important to understand that the URI scheme defined in <ref idref="externalURI"
				/> can only be used to identify relationships among and provide source links to
				external schemas being reused. It is not sufficient to allow references or links to
				such schemas stand in for a physical copy. Thus, all schema artifacts necessary to
				define, validate, and use an IEPD must be physically present within that IEPD. In
				accordance with the <ref idref="NIEM-NDR"/>, if IEPD schemas are moved to an
				operational environment for implementation, validation, or other purposes, then
				absolute references may replace relative <termRef>path name</termRef> references
				when needed. The following rule applies when absolute references to Internet
				resources are required.</p>

			<ruleSection>
				<title>IEPD Reference to Resource Uses Common URI Scheme</title>
				<rule id="r-iepd-protocol" applicability="WF-IEPD" class="Constraint">
					<p>An absolute reference to an Internet resource MUST use a well-known URI
						scheme (e.g., http, https, ftp, ftps) and MUST <termRef term="resolve URI"
							>resolve</termRef>. If applicable, documentation SHOULD describe how to
							<termRef term="resolve URI">resolve</termRef> with security, account,
						and/or password information.</p>
				</rule>
			</ruleSection>

		</section>



		<section id="IEPD-Completeness">
			<title>IEPD Completeness</title>

			<p>Since an <termRef term="information exchange package documentation">IEPD</termRef>
				defines an information exchange and is often implemented by persons other than the
				original author, it is important to ensure that they are relatively complete and
				provide all artifacts needed to use the <termRef
					term="information exchange package documentation">IEPD</termRef>.</p>

			<ruleSection>
				<title>IEPD Completeness</title>
				<rule id="r-iepd-documents" applicability="IEPD" class="Constraint">
					<p>An <termRef term="information exchange package documentation">IEPD</termRef>
						SHOULD contain all artifacts needed to understand it and facilitate its
						correct implementation.</p>
				</rule>
			</ruleSection>

			<p>The rule above means that an <termRef
					term="information exchange package documentation">IEPD</termRef> implementer
				should not be forced to search for or track down specialized schema documents,
				documentation, or other artifacts required to validate and implement exchanges
				defined by an <termRef term="information exchange package documentation"
					>IEPD</termRef>. Specialized artifacts refer to those designed and built by an
					<termRef term="information exchange package documentation">IEPD</termRef>
				author, not artifacts that are standards and publicly available to all implementers.
				For example, this rule does not imply that an <termRef
					term="information exchange package documentation">IEPD</termRef> should contain
				a schema document that defines the XML schema component vocabulary identified by the
				namespace name <code>http://www.w3.org/2001/XMLSchema</code> (i.e., XS), or
					<code>http://www.w3.org/2001/XMLSchema-instance</code> (i.e., XSI). All schema
				processors have appropriate declarations for these built in. Likewise, an <termRef
					term="information exchange package documentation">IEPD</termRef> is not required
				to contain <code>MACRO_IEPD_catalog_xsd_name</code> or the standard NIEM subset that
				supports it.</p>

			<p>On the other hand, an <termRef term="information exchange package documentation"
					>IEPD</termRef> whose author has extended the IEPD catalog schema is clearly
				required to contain the catalog extension schema document, since this is a
				specialized customization created by the author. If a different NIEM schema subset
				is also used, then the <termRef term="information exchange package documentation"
					>IEPD</termRef> must also contain its superset (i.e., a complete subset that
				incorporates both the original subset with additional NIEM components used to extend
				the catalog schema document; see <ref idref="r3-iepd-cat-ext-xsd"/>.)</p>

			<p>The rationale for "SHOULD" in <ref idref="r-iepd-documents"/> relates to issues of
				security. Although NIEM is generally public, some IEPDs may
				contain XML tags that provide more semantics or structure than a domain is willing
				to expose. In such cases, it may be necessary to simply refer to schema documents
				that are required for validation and implementation, instead of circulating them
				within a public <termRef term="information exchange package documentation"
					>IEPD</termRef>. Implementers would then be expected to know how and where to
				obtain the required documents.</p>

			<p>The <ref idref="NIEM-NDR"/> explains how NIEM employs adapter types to encapsulate
				and use other standards (e.g., geospatial and emergency management standards) in
				their native forms that are not NIEM-conformant. Other standards may use
					<qName>xs:import</qName> without requiring <code>schemaLocation</code>
				attributes (instead, relying only on the namespace value). These standards may also
				use <qName>xs:include</qName>. This XML Schema construct is disallowed by NIEM. When
				standards external to NIEM are required within IEPDs, the following rule
				applies:</p>

			<ruleSection>
				<title>IEPD External Schema Documents Are Local Resources</title>
				<rule id="r-iepd-other-stds" applicability="WF-IEPD" class="Constraint">
					<p>Within an IEPD, a non-NIEM-conformant external schema document reference to
						another schema document and/or namespace MUST <termRef term="resolve URI"
							>resolve</termRef> to a local resource. <code>schemaLocation</code>
						attributes or XML catalogs can be used to ensure resolution.</p>
				</rule>
			</ruleSection>

			<p>For the case of non-NIEM-conformant schemas, this rule ensures that all schemas (or
				corresponding artifacts and namespaces) from external standards required for
				definition, validation, and use of the IEPD are present within it.</p>

			<p>XML schemas are the heart of IEPDs since they formally specify normative structure
				and semantics for <termRef term="data component">data components</termRef>. However,
				in general, an IEPD is a closed set of artifacts. This means that all hyperlink
				references within artifacts should <termRef term="resolve URI">resolve</termRef> to
				the appropriate artifact.</p>

			<ruleSection>
				<title>Key IEPD Resources Are Local Resources</title>
				<rule id="r-iepd-resources" applicability="WF-IEPD" class="Constraint">
					<p>Within any artifact of an IEPD, any direct reference to another resource
						(i.e., another artifact such as an image, schema, stylesheet, etc.) that is
						required to process or display an artifact SHOULD exist within the IEPD at
						the location specified by that reference.</p>
				</rule>
			</ruleSection>

			<p>This means that IEPD artifacts, including documentation artifacts, should be
				complete. For example, if an HTML document within an IEPD contains a hyperlink
				reference (<code>href</code>) to an artifact that is part of or used by the IEPD,
				then the file associated with that hyperlink should be present in the IEPD; likewise
				for a sourced (<code>src</code>) image. Authors should exercise good judgment with
				this rule. For example, it does not require an IEPD to contain copies of all cited
				documents from a table of references if it contains hyperlinks to those documents.
				The key operating words in this rule are: "another resource is required to process
				or display an artifact SHOULD exist within the IEPD."</p>

			<p>In some cases, it may not be possible to include all artifacts, even schemas, in an
				IEPD without violating laws, regulations, or policies. For example, an <termRef
					term="information exchange package documentation">IEPD</termRef> may require use
				of a schema document that is not publicly accessible; it might be classified or
				controlled unclassified information (CUI). This is a valid reason for exception to
					<ref idref="r-iepd-resources"/>. If the <termRef
					term="information exchange package documentation">IEPD</termRef> is placed in
				the public domain, the author should omit the non-public schema document, and if
				appropriate, document the omission, and explain where and/or how the missing schema
				document can be obtained.</p>

		</section>


		<section id="Duplication-of-Artifacts">
			<title>Duplication of Artifacts</title>

			<p>Within an IEPD, the replication of files or entire file sets should be avoided.
				However, replication is allowed if a reasonable rationale exists. In some cases,
				file replication may make it easier to use, validate, implement, or automatically
				process an IEPD. For example, multiple subsets and/or constraint sets may overlap in
				many identical schema documents. Yet, allowing this duplication may be easier or
				necessary to accommodate a validation tool, rather than removing duplicate schema
				documents, and forcing the tool to search for them. Whenever possible, use XML
				catalogs to coordinate schema assembly.</p>

		</section>
	</section>


	<p>
		<char name="nbsp"/>
	</p>


	<!-- #################################### Appendices ##################################### -->


	<section id="IEPD-Catalog-XSD" isAppendix="true">
		<title>IEPD Catalog XML Schema Document</title>
		<pre><include-text href="MACRO_IEPD_catalog_xsd_path"/></pre>

		<p>
			<char name="nbsp"/>
		</p>
	</section>

	<section id="IEPD-Catalog-Document-CoT" isAppendix="true">
		<title>Example IEPD Catalog Document for Cursor on Target</title>
		<p>Below is a simple example of an IEPD catalog document for a <em>Cursor on Target</em>
			<termRef term="information exchange package documentation">IEPD</termRef>. The entire
			<termRef term="information exchange package documentation">IEPD</termRef> and other example IEPDs and supporting artifacts are available on the <ref idref="NIEM-Template-IEPD-Repository"/>.</p>
		<pre><include-text href="xsd/iepd-catalog.xml"/></pre>

		<p>
			<char name="nbsp"/>
		</p>
	</section>

	<section id="IEPD-Artifacts" isAppendix="true">
		<title>Common IEPD Artifacts</title>

		<p>Notes:</p>
		<ul>
			<li>
				<p>(IEPD) in artifact name indicates a required artifact for an <termRef
						term="information exchange package documentation">IEPD</termRef>.</p>
			</li>
			<li>
				<p>(ref) indicates name is hyperlinked to a defined term in the specification.</p>
			</li>
			<li>
				<p>* in filename syntax indicates wildcard.</p>
			</li>
		</ul>

		<table id="iepd-artifacts">
			<theadr>
				<th>Artifact name</th>
				<th>Filename syntax</th>
				<th>Definition</th>
			</theadr>
			<tr>
				<td>(IEPD) <termRef>IEPD catalog document</termRef></td>
				<td>iepd-catalog.xml</td>
				<td>(ref)</td>
			</tr>
			<tr>
				<td>(IEPD) <termRef>change log</termRef></td>
				<td>*.*</td>
				<td>(ref)</td>
			</tr>
			<tr>
				<td>(IEPD) <termRef>readme artifact</termRef></td>
				<td>*.*</td>
				<td>(ref)</td>
			</tr>
			<tr>
				<td>(IEPD) <termRef>conformance assertion</termRef></td>
				<td>*.*</td>
				<td>(ref)</td>
			</tr>
			<tr>
				<td>
					<termRef>XML catalog document</termRef>
				</td>
				<td>*.xml</td>
				<td>(ref)</td>
			</tr>
			<tr>
				<td>conformance report</td>
				<td>*.*</td>
				<td>a formal detailed report on conformance generated by a NIEM-aware tool or
					manually prepared (or both)</td>
			</tr>
			<tr>
				<td>IEPD catalog extension <termRef>XML catalog document</termRef></td>
				<td>iepd-catalog-extension-xml-catalog.xml</td>
				<td>an XML catalog that identifies an IEPD catalog extension schema document
					(ref)</td>
			</tr>
			<tr>
				<td>IEPD catalog <termRef>extension schema document</termRef></td>
				<td>*.xsd</td>
				<td>a XML schema document that extends an IEPD catalog schema (ref)</td>
			</tr>
			<tr>
				<td>
					<termRef>subset schema document</termRef>
				</td>
				<td>*.xsd</td>
				<td>(ref)</td>
			</tr>
			<tr>
				<td>
					<termRef>NIEM wantlist</termRef>
				</td>
				<td>*.xml</td>
				<td>(ref)</td>
			</tr>
			<tr>
				<td>
					<termRef>extension schema document</termRef>
				</td>
				<td>*.xsd</td>
				<td>(ref)</td>
			</tr>
			<tr>
				<td>
					<termRef>external schema document</termRef>
				</td>
				<td>*.xsd</td>
				<td>(ref)</td>
			</tr>
			<tr>
				<td>
					<termRef>reference schema document</termRef>
				</td>
				<td>*.xsd</td>
				<td>(ref)</td>
			</tr>
			<tr>
				<td>IEP sample <termRef>XML document</termRef></td>
				<td>*.xml</td>
				<td>an XML document instance that exemplifies an <termRef>IEP conformance
						target</termRef> defined by a <qName>c:IEPConformanceTarget</qName>
					(ref)</td>
			</tr>
			<tr>
				<td>Schematron schema document</td>
				<td>*.sch</td>
				<td>a business rule schema in <ref idref="ISO-Schematron"/> format</td>
			</tr>
			<tr>
				<td>RelaxNG schema document</td>
				<td>*.rng</td>
				<td>a business rule schema in <ref idref="ISO-RelaxNG"/> format</td>
			</tr>
			<tr>
				<td>documentation</td>
				<td>*.*</td>
				<td>a textual or graphic artifact containing notes, instructions, guidance,
					etc.</td>
			</tr>
			<tr>
				<td>application information</td>
				<td>*.*</td>
				<td>a tool-specific artifact used, generated, exported, imported, etc. by a specific
					tool; includes models, databases, configuration files, graphics, etc.</td>
			</tr>
		</table>

		<p>
			<char name="nbsp"/>
		</p>
	</section>


	<section id="Conformance-Assertion-Example" isAppendix="true">
		<title>Conformance Assertion Example</title>

		<p>A NIEM conformance assertion is a required artifact for an <termRef
				term="information exchange package documentation">IEPD</termRef>. The following is a
			simple example of a conformance assertion (in this case, a self assertion by the author,
			but with assistance from colleagues. The concept is to provide implementers with some
			information that indicates how well an <termRef
				term="information exchange package documentation">IEPD</termRef> has been checked
			for quality and conformance with respect to XML Schema and NIEM. The assertion can be as
			simple as the <em>assertion</em> clause. However, clearly the more detail that is
			provided, the stronger the case for conformance and quality will be.</p>

		<image src="img/niem-conformance-assertion.png"/>

	</section>


	<!-- ################### Non-normative Guidance for IEPD Directories ################### -->


	<section id="Guidance-IEPD-Directories" isAppendix="true">
		<title>Guidance for IEPD Directories (non-normative)</title>

		<p>NIEM releases (and their associated core supplements) and domain updates generally follow
			a consistent directory organization. When employing a release, its supplements, and
			updates within IEPDs whether as-is or as subsets, developers are encouraged to maintain
			their original directory structures. However, aside from applicable rules previously
			stated in the preceding sections, there are no normative rules for organizing
			directories within IEPDs.</p>

		<p>Guidance for directory structuring may be useful to authors, especially in the case of a
			relatively simple <termRef term="information exchange package documentation"
				>IEPD</termRef> with a single schema document subset, and a few extension and
			external schema documents. The following are common non-normative practices for <termRef
				term="information exchange package documentation">IEPD</termRef> directories:</p>

		<ol>

			<li>
				<p>Create a root directory for the <termRef
						term="information exchange package documentation">IEPD</termRef> from the
					name and version identifier of the <termRef
						term="information exchange package documentation">IEPD</termRef>. For
					example <code>my_iepd-3.2rev4</code>. (<ref idref="r-iepd-archive-one-root"
					/>)</p>
			</li>

			<li>
				<p>For every IEPD, an <code>iepd-catalog.xml</code> artifact (<ref idref="r-wf-iepd"
					/>) is required to be in the <termRef>IEPD root directory</termRef></p>
			</li>

			<li>
				<p>If extending the <termRef>IEPD catalog document</termRef>, then per <ref
						idref="r1-iepd-cat-ext-xml-cat"/>
					<code>iepd-catalog-extension-xml-catalog.xml</code> must reside in the same
					relative directory as the <code>iepd-catalog.xml</code> it supports (normally,
					the <termRef>IEPD root directory</termRef>).
						<code>iepd-catalog-extension.xsd</code> can be located anywhere in the IEPD
					because <code>iepd-catalog-extension-xml-catalog.xml</code> correlates its
					namespace to its URI. However, this specification recommends both artifacts be
					co-located in the <termRef>IEPD root directory</termRef> for visibility:</p>
				<ul>
					<li>
						<p><code>iepd-catalog-extension-xml-catalog.xml</code> (<ref
								idref="r1-iepd-cat-ext-xml-cat"/>)</p>
					</li>
					<li>
						<p>
							<code>iepd-catalog-extension.xsd</code>
						</p>
					</li>

				</ul>
			</li>

			<li>
				<p>Include the following artifacts and ensure each is identified (tagged)
					appropriately within the <termRef>IEPD catalog document</termRef>:</p>
				<ul>
					<li>
						<p>readme artifact</p>
					</li>
					<li>
						<p>change log artifact</p>
					</li>
					<li>
						<p>conformance-assertion artifact</p>
					</li>
					<li>
						<p>conformance-report artifact (if present)</p>
					</li>
				</ul>
				<p>Recommend these artifacts be located in the <termRef>IEPD root
						directory</termRef>.</p>
			</li>

			<li>
				<p>Create the following directories within the <termRef>IEPD root
						directory</termRef>:</p>
				<ul>
					<li>
						<p><code>base-xsd</code>
							<char name="mdash"/> will contain the NIEM subset and its associated
							extension, external, and custom NIEM schema documents. These are the
							NIEM XML schema documents used to validate conformance of an instance
							XML document. Subdirectories under <code>base-xsd</code> may
							include:</p>
						<ul>
							<li>
								<p><code>niem</code>
									<char name="mdash"/> a NIEM schema subset organized as the
									Schema Subset Generation Tool (SSGT) generates it (including
										<code>wantlist.xml</code> and <code>xml-catalog.xml</code>
									artifacts).</p>
							</li>
							<li>
								<p><code>extension</code>
									<char name="mdash"/> for NIEM extension schema documents.</p>
							</li>
							<li>
								<p><code>external</code>
									<char name="mdash"/> for non-NIEM standards used by the <termRef
										term="information exchange package documentation"
										>IEPD</termRef>.</p>
							</li>
							<li>
								<p><code>niem-custom</code>
									<char name="mdash"/> for NIEM schema documents that may be
									customized (extended or restricted) such as
										<code>structures.xsd</code>.</p>
							</li>
						</ul>
					</li>

					<li>
						<p><code>constraint-xsd</code>
							<char name="mdash"/> will contain constraint schema documents organized
							as necessary. Usually this schema document set will be organized
							similarly to schema documents in <code>base-xsd</code> because it is
							customary to start with the base schema set and constrain it as
							necessary.</p>
					</li>
				</ul>
			</li>

			<li>
				<p>If using Schematron, create a <code>schematron</code> subdirectory for any
					Schematron schemas (or create the appropriate subdirectory name for any other
					kinds of business rule artifacts).</p>
			</li>

			<li>
				<p>If using specialized <termRef term="XML schema document">XML schema
						documents</termRef> for optimized EXI serialization, create an
						<code>exi-xsd</code> subdirectory for them.</p>
			</li>

			<li>
				<p>Create an <code>iep-sample</code> subdirectory for sample IEPs (<ref
						idref="r-iep-samples"/>).</p>
			</li>

			<li>
				<p>If more documentation artifacts (e.g., text, graphics, media) are necessary,
					create a <code>documentation</code> subdirectory for miscellaneous explanatory
					documentation. As needed, create additional subdirectories within this one to
					organize documentation artifacts. The readme artifact in the <termRef>IEPD root
						directory</termRef> should refer to or index documentation in this
					subdirectory.</p>
			</li>

			<li>
				<p>If necessary, create an <code>application-info</code> subdirectory for
					tool-specific artifacts (inputs, outputs, imports, exports, models, etc.).
					Again, as needed, use additional subdirectories to organize artifacts of this
					nature. The readme artifact can and should also refer to or index artifacts in
					this subdirectory.</p>
			</li>

			<li>
				<p>Maintain a <termRef>NIEM wantlist</termRef> within the same subdirectory as the
					subset it generates (<ref idref="r-wantlist-base"/>).</p>
			</li>

			<li>
				<p>Maintain an <code>xml-catalog.xml</code> closest to the XML schema document set
					it relates to. Use <code>er:nextCatalog</code> elements as needed to help
					maintain this proximity).</p>
			</li>

			<li>
				<p>Finally, if it becomes necessary to maintain multiple <code>constraint-xsd</code>
					or <code>extension</code> subdirectories (or any other subdirectories) together
					in the same directory, then simply suffix each directory name with a distinct
					character string (for example, <code>extension1</code>, <code>extension2</code>,
					etc.; or <code>extension-abc</code>, <code>extension-zyx</code>, etc.)</p>
			</li>

		</ol>

		<p>Obviously, there are many other ways to organize for more complex business requirements
			in which a single <termRef term="information exchange package documentation"
				>IEPD</termRef> employs multiple releases, core supplements, subsets, constraint
			sets, and domain updates. Regardless of directory organization and file naming, an
				<termRef term="information exchange package documentation">IEPD</termRef> author
			must always configure all IEP conformance targets using the IEPD catalog
				<qName>c:IEPConformanceTarget</qName> element and the appropriate validation
			artifacts (such as XML catalogs, Schematron schemas, RelaxNG schemas, etc.).</p>

		<p>The guidance above results in the <termRef
				term="information exchange package documentation">IEPD</termRef> directory structure
			and naming that appears below. Notes are in parentheses. Filenames within the
				<code>extension</code>, <code>external</code>, <code>schematron</code>, and
				<code>iep-sample</code> subdirectories are non-normative examples. Authors are free
			to assign names for such files according to their own requirements (if they do not
			violate rules in this specification).</p>
		<pre><strong>
	/my_iepd-3.2rev4			(root directory of IEPD)

		iepd-catalog.xml				(normative artifact name)
		iepd-catalog-extension.xsd
		iepd-catalog-extension-xml-catalog.xml	(normative artifact name)
		changelog.*
		conformance-assertion.*
		readme.*

		/base-xsd

			/niem			(subset)
				/xsd
					/adapters
					/auxiliary
					/codes
						/genc
					/domains
					/external
						/have
						/ogc
					/utility
						appinfo.xsd
						code-lists-instance.xsd
						code-lists-schema-appinfo.xsd
						conformanceTargets.xsd
						structures.xsd
					niem-core.xsd
					wantlist.xml
					xml-catalog.xml

			/niem-custom		(extension/restriction of structures)
				structures.xsd

			/extension
				query.xsd
				response.xsd
				extension1.xsd
				extension2.xsd
				...
				xml-catalog.xml

			/external
				/stix
				/ic-ism
				...
				xml-catalog.xml

		/constraint-xsd			(constraint schema document sets)

			/niem			(constraints on subset)
				/adapters
				/appinfo
				/codes
				/conformanceTargets
				...
				wantlist.xml
				xml-catalog.xml

			/extension		(constraints on extensions)
				query.xsd
				extension1.xsd
				xml-catalog.xml

		/exi-xsd
			gml.xsd
			xs.xsd
			...

		/schematron
			business-rules1.sch
			business-rules2.sch
			...
			
		/iep-sample
			query.xml
			request.xml
			...

		/application-info
			... (tool inputs, outputs, etc.)

		/documentation
			... (human readable documentation)
</strong></pre>

		<p>
			<char name="nbsp"/>
		</p>
	</section>



	<section id="Acronyms-and-Abbreviations" isAppendix="true">
		<title>Acronyms and Abbreviations</title>

		<table id="acronyms-abbreviations">

			<theadr>
				<th>Acronym / Abbreviation</th>
				<th>Literal or Definition</th>
			</theadr>

			<tr>
				<td>ASCII</td>
				<td>American Standard Code for Information Interchange</td>
			</tr>
			<tr>
				<td>CSV </td>
				<td>Comma Separated Value (file format)</td>
			</tr>
			<tr>
				<td>CUI </td>
				<td>Controlled Unclassified Information</td>
			</tr>
			<tr>
				<td>EBV </td>
				<td>Effective Boolean Value</td>
			</tr>
			<tr>
				<td>GIF </td>
				<td>Graphic Interchange Format</td>
			</tr>
			<tr>
				<td>GML </td>
				<td>Geospatial Markup Language</td>
			</tr>
			<tr>
				<td>HTML </td>
				<td>Hyper Text Markup Language</td>
			</tr>
			<tr>
				<td>IEP </td>
				<td>information exchange package</td>
			</tr>
			<tr>
				<td>IEPD </td>
				<td>information exchange package documentation</td>
			</tr>
			<tr>
				<td>IRI </td>
				<td>Internationalized Resource Identifier</td>
			</tr>
			<tr>
				<td>JPG </td>
				<td>Joint Photographic (Experts) Group</td>
			</tr>
			<tr>
				<td>LEXS </td>
				<td>Logical Entity Exchange Specifications</td>
			</tr>
			<tr>
				<td>NCName</td>
				<td>Non-colonized Name (in XML Schema: unprefixed and no colon character)</td>
			</tr>
			<tr>
				<td>NDR </td>
				<td>Naming and Design Rules</td>
			</tr>
			<tr>
				<td>NIEM </td>
				<td>National Information Exchange Model</td>
			</tr>
			<tr>
				<td>NTAC </td>
				<td>NIEM Technical Architecture Committee</td>
			</tr>
			<tr>
				<td>OGC </td>
				<td>Open Geospatial Consortium</td>
			</tr>
			<tr>
				<td>PDF </td>
				<td>Portable Document Format</td>
			</tr>
			<tr>
				<td>PNG </td>
				<td>Portable Network Graphic</td>
			</tr>
			<tr>
				<td>QName</td>
				<td>Qualified Name (in XML Schema: a name qualified by a namespace)</td>
			</tr>
			<tr>
				<td>RFC </td>
				<td>Request for Comment</td>
			</tr>
			<tr>
				<td>SSGT </td>
				<td>Schema Subset Generation Tool</td>
			</tr>
			<tr>
				<td>TDF </td>
				<td>Trusted Data Format</td>
			</tr>
			<tr>
				<td>UML </td>
				<td>Unified Modeling Language</td>
			</tr>
			<tr>
				<td>UPA </td>
				<td>Unique Particle Attribution</td>
			</tr>
			<tr>
				<td>URI </td>
				<td>Uniform Resource Identifier</td>
			</tr>
			<tr>
				<td>URL </td>
				<td>Uniform Resource Locator </td>
			</tr>
			<tr>
				<td>URN </td>
				<td>Uniform Resource Name</td>
			</tr>
			<tr>
				<td>W3C </td>
				<td>World Wide Web Consortium</td>
			</tr>
			<tr>
				<td>XMI </td>
				<td>XML Metadata Interchange</td>
			</tr>
			<tr>
				<td>XML </td>
				<td>Extensible Markup Language</td>
			</tr>
			<tr>
				<td>XS </td>
				<td>XML Schema (namespace prefix)</td>
			</tr>
			<tr>
				<td>XSD </td>
				<td>XML Schema Definition</td>
			</tr>
			<tr>
				<td>XSI </td>
				<td>XML Schema Instance (namespace prefix)</td>
			</tr>
			<tr>
				<td>XSLT </td>
				<td>Extensible Stylesheet Language Transformation</td>
			</tr>
		</table>

		<p>
			<char name="nbsp"/>
		</p>
	</section>



	<section id="References" isAppendix="true">
		<title>References</title>

		<reference id="BCP14" label="BCP 14">
			<p><q>Internet Engineering Task Force Best Current Practice 14.</q> Available from
					<link>https://www.ietf.org/rfc/bcp/bcp14.txt</link>. BCP 14 is composed of:</p>
			<sub>
				<reference id="RFC2119" label="RFC 2119">
					<p>Bradner, S., <q>Key words for use in RFCs to Indicate Requirement Levels,</q>
						BCP 14, RFC 2119, March 1997. Available from
							<link>http://www.ietf.org/rfc/rfc2119.txt</link>.</p>
				</reference>
				<reference id="RFC8174" label="RFC 8174">
					<p>Leiba, B., <q>Ambiguity of Uppercase vs Lowercase in RFC 2119 Key Words,</q>
						BCP 14, RFC 8174, May 2017. Available from
							<link>https://www.ietf.org/rfc/rfc8174.txt</link>.</p>
				</reference>
			</sub>
		</reference>

		<reference id="FEA-DRM" label="FEA Data Reference Model 1.0">
			<p><q>The Federal Enterprise Architecture Data Reference Model,</q> Version 1.0,
				September 2004. The version 1.0 document is longer publicly available. A more recent DRM
				Version 2.0, 17 November 2005 is available from
			<link>https://obamawhitehouse.archives.gov/sites/default/files/omb/assets/egov_docs/DRM_2_0_Final.pdf</link></p>
		</reference>

		<reference id="GJXDM-IEPD" label="GJXDM IEPD Guidelines 1.1">
			<p><q>GJXDM Information Exchange Package Documentation Guidelines,</q> Version 1.1,
				Global XML Structure Task Force (GXSTF), 2 March 2005. Available from
					<link>http://it.ojp.gov/documents/global_jxdm_IEPD_guidelines_v1_1.pdf</link></p>
		</reference>

		<reference id="ISO-11179-4" label="ISO 11179-4">
			<p><q>ISO/IEC 11179-4 Information Technology <char name="mdash"/> Metadata Registries
					(MDR) <char name="mdash"/> Part 4: Formulation of Data Definitions Second
					Edition,</q> 15 July 2004. Available from
					<link>http://standards.iso.org/ittf/PubliclyAvailableStandards/c035346_ISO_IEC_11179-4_2004(E).zip</link>.</p>
		</reference>

		<reference id="ISO-RelaxNG" label="ISO RelaxNG">
			<p><q>Document Schema Definition Language (DSDL) <char name="mdash"/> Part 2:
					Regular-grammar-based validation <char name="mdash"/> RELAX NG,</q> ISO/IEC
				19757-2:2008, Second Edition, 15 December 2008. Available from
					<link>http://standards.iso.org/ittf/PubliclyAvailableStandards/c052348_ISO_IEC_19757-2_2008(E).zip</link>.
				See also <link>http://relaxng.org</link>.</p>
		</reference>
		
		<reference id="ISO-Schematron" label="ISO Schematron">
			<p><q>Document Schema Definition Languages (DSDL) <char name="mdash"/> Part 3: Rule-based
				validation using Schematron,</q> ISO/IEC 19757-3:2020, Third
				Edition, 2020-06. Available from
				<link>https://www.iso.org/standard/74515.html</link>.</p>
		</reference>

		<reference id="LEXS" label="Logical Entity Exchange Specifications">
			<p><q>Logical Entity Exchange Specifications,</q> Version 5.0, 12 October 2016. Available
				from <link>https://it.ojp.gov/NISS/iepd/457</link>.</p>
		</reference>

		<reference id="NIEM-CodeLists" label="NIEM Code List Specification">
			<p>Webb Roberts, ed. <q>National Information Exchange Model Code Lists Specification,</q> Version 4.0, NIEM Technical Architecture Committee (NTAC). Available from
				<link>https://reference.niem.gov/niem/specification/code-lists/4.0/</link>.</p>
		</reference>
		
		<reference id="NIEM-Conformance" label="NIEM Conformance Specification">
			<p><q>National Information Exchange Model Conformance Specification,</q> Version 5.0, NIEM Technical Architecture Committee (NTAC). Available from
				<link>https://reference.niem.gov/niem/specification/conformance/5.0/</link>.</p>
		</reference>
		
		<reference id="NIEM-CTAS" label="NIEM Conformance Targets Attribute Specification">
			<p><q>NIEM Conformance Targets Attribute Specification,</q> Version 3.0, NIEM
				Technical Architecture Committee (NTAC). Available from				<link>https://reference.niem.gov/niem/specification/conformance-targets-attribute/3.0/</link>.</p>
		</reference>

		<reference id="NIEM-HLVA" label="NIEM High-Level Version Architecture">
			<p><q>NIEM High Level Version Architecture (HLVA),</q> Version 3.0, NIEM Technical
				Architecture Committee. Available from
				<link>https://reference.niem.gov/niem/specification/high-level-version-architecture/3.0/</link>.</p>
		</reference>

		<reference id="NIEM-NDR" label="NIEM Naming and Design Rules">
			<p>Webb Roberts. <q>National Information Exchange Model Naming and Design Rules,</q> Version 5.0, NIEM Technical Architecture Committee (NTAC).
				<link>https://reference.niem.gov/niem/specification/naming-and-design-rules/5.0/</link>.</p>
		</reference>

		<reference id="NIEM-SSGT" label="NIEM SSGT">
			<p><q>NIEM Schema Subset Generation Tool (SSGT).</q> Available from
					<link>http://tools.niem.gov/niemtools/ssgt/index.iepd</link>.</p>
		</reference>

		<reference id="NIEM-TechHub" label="NIEM TechHub">
			<p>NIEM's TechHub provides the developer community with resources and training that will help them use NIEM. Available from <link>https://niem.github.io/</link>.</p>
		</reference>
		
		<reference id="NIEM-Template-IEPD-Repository" label="NIEM Template IEPD repository">
			<p>The NIEM Template IEPD can be used as a starting point or a reference for developing a new IEPD. Available from
				<link>https://github.com/NIEM/Template-IEPD/</link>.</p>
		</reference>
		
		<reference id="OASIS-XML-Catalogs" label="XML Catalogs 1.1">
			<p><q>XML Catalogs,</q> Organization for the Advancement of Structured Information
				Standards (OASIS) Standard v1.1, 7 October 2005. Available from
					<link>https://www.oasis-open.org/committees/download.php/14809/std-entity-xml-catalogs-1.1.html</link>.</p>
		</reference>

		<reference id="PKZIP">
			<p><q>APPNOTE.TXT - .ZIP File Format Specification,</q> Version: 6.3.2, Revised: 28
				September 2007, Copyright (c) 1989 - 2007 PKWare Inc. Available from
					<link>http://www.pkware.com/documents/casestudies/APPNOTE.TXT</link>.</p>
		</reference>

		<reference id="Principles-of-Data-Integration" label="Principles of Data Integration">
			<p>Doan, A., Halevy, A., and Ives, X. (2012), <q>Principles of Data Integration,</q>
				New York, NY: Morgan Kaufmann.</p>
		</reference>

		<reference id="RFC3986-URI" label="RFC 3986 URI">
			<p>Berners-Lee, T., et al., <q>Uniform Resource Identifier (URI): Generic Syntax,</q>
				Request for Comment 3986, Network Working Group, January 2005. Available from
					<link>http://tools.ietf.org/html/rfc3986</link>.</p>
		</reference>

		<reference id="RFC3987-IRI" label="RFC 3987 IRI">
			<p>Duerst, M., and Suignard, M., <q>Internationalized Resource Identifiers (IRIs),</q>
				Request For Comment 3987, January 2005. Avalailable from
					<link>http://tools.ietf.org/html/rfc3987</link>.</p>
		</reference>

		<reference id="W3-EXI" label="EXI Format 1.0">
			<p><q>Efficient XML Interchange (EXI) Format,</q> Version 1.0 (Second Edition), W3C Recommendation, 11 February 2014. Available from
				<link>http://www.w3.org/TR/2014/REC-exi-20140211/</link>.</p>
		</reference>

		<reference id="W3-XML" label="W3C XML 1.0">
			<p><q>Extensible Markup Language (XML),</q> Version 1.0, Fifth Edition, W3C
				Recommendation 26 November 2008. Available from
					<link>http://www.w3.org/TR/2008/REC-xml-20081126/</link>.</p>
		</reference>

		<reference id="W3-XML-InfoSet" label="W3C XML InfoSet">
			<p><q>XML Information Set,</q> Second Edition, W3C Recommendation 4 February 2004.
				Available from <link>http://www.w3.org/TR/2004/REC-xml-infoset-20040204/</link>.</p>
		</reference>

		<reference id="W3-XML-Namespaces" label="W3C XML Namespaces">
			<p><q>Namespaces in XML 1.0,</q> Third Edition, World Wide Web Consortium 8 December 2009.
				Available from <link>https://www.w3.org/TR/2009/REC-xml-names-20091208/</link>.</p>
		</reference>

		<reference id="W3-XML-Schema-Datatypes" label="W3C XML Schema Part 2 Datatypes">
			<p><q>XML Schema Part 2: Datatypes,</q> Second Edition, W3C Recommendation 28 October
				2004. Available from
					<link>http://www.w3.org/TR/2004/REC-xmlschema-2-20041028/</link>.</p>
		</reference>

		<reference id="W3-XML-Schema-Structures" label="W3C XML Schema Part 1 Structures">
			<p><q>XML Schema Part 1: Structures,</q> Second Edition, W3C Recommendation 28 October
				2004. Available from
					<link>http://www.w3.org/TR/2004/REC-xmlschema-1-20041028/</link>.</p>
		</reference>

		<reference id="W3-XPath" label="W3C XPath 3.1">
			<p><q>XML Path Language (XPath) 3.1,</q> W3C Recommendation 21 March 2017. Available from
				<link>https://www.w3.org/TR/2017/REC-xpath-31-20170321/</link>.</p>
		</reference>

		<reference id="W3-XSLT" label="XSLT 1.0">
			<p><q>XSL Transformations (XSLT),</q> Version 1.0, W3C Recommendation 16 November
				1999. Available from <link>http://www.w3.org/TR/1999/REC-xslt-19991116</link>.</p>
		</reference>

		<reference id="W3-XSLT2" label="XSLT 2.0">
			<p><q>XSL Transformations (XSLT),</q> Version 2.0, Second Edition, W3C Recommendation 21 April 2009.
				Available from <link>https://www.w3.org/TR/2009/PER-xslt20-20090421/</link>.</p>
		</reference>
		
		<reference id="W3-XSLT3" label="XSLT 3.0">
			<p><q>XSL Transformations (XSLT),</q> Version 3.0, W3C Recommendation 8 June 2017.
				Available from <link>https://www.w3.org/TR/2017/REC-xslt-30-20170608/</link>.</p>
		</reference>

	</section>


	<section>
		<title>Index of Definitions</title>
		<indexOfDefinitions/>
	</section>


	<section>
		<title>Index of Rules</title>
		<indexOfRules/>
	</section>

</document>
