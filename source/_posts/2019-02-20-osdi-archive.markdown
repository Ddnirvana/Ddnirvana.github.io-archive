---
layout: post
title: "OSDI archive"
date: 2019-02-20 21:19:25 +0800
comments: true
categories: papers
---

Although the program of each OSDI conference can be easily found in the network, an archive page can help us to soonly review the history published work on OSDI. :)



This page will be updated continuously~ (if not, you can notify me through email)







## OSDI 2018

### Understanding Failures

**<font color=#005493>Capturing and Enhancing In Situ System Observability for Failure Detection</font>**

Peng Huang, *Johns Hopkins University;* Chuanxiong Guo, *ByteDance Inc.;* Jacob R. Lorch and Lidong Zhou, *Microsoft Research;* Yingnong Dang, *Microsoft*

**Abstract** Real-world distributed systems suffer unavailability due to various types of failure. But, despite enormous effort, many failures, especially gray failures, still escape detection. In this paper, we argue that the missing piece in failure detection is detecting what the requesters of a failing component see. This insight leads us to the design and implementation of Panorama, a system designed to enhance \emph{system observability} by taking advantage of the interactions between a system's components. By providing a systematic channel and analysis tool, Panorama turns a component into a logical observer so that it not only handles errors, but also \emph{reports} them. Furthermore, Panorama incorporates techniques for making such observations even when indirection exists between components. Panorama can easily integrate with popular distributed systems and detect all 15 \emph{real-world} gray failures that we reproduced in less than 7 s, whereas existing approaches detect only one of them in under 300 s.

[AVAILABLE](https://www.usenix.org/conference/osdi18/presentation/huang)



**<font color=#005493>REPT: Reverse Debugging of Failures in Deployed Software</font>**

Weidong Cui and Xinyang Ge, *Microsoft Research Redmond;* Baris Kasikci, *University of Michigan;* Ben Niu, *Microsoft Research Redmond;* Upamanyu Sharma, *University of Michigan;* Ruoyu Wang, *Arizona State University;* Insu Yun, *Georgia Institute of Technology*

***Awarded Best Paper!***

**Abstract** Debugging software failures in deployed systems is important because they impact real users and customers. However, debugging such failures is notoriously hard in practice because developers have to rely on limited information such as memory dumps. The execution history is usually unavailable because high-fidelity program tracing is not affordable in deployed systems.

In this paper, we present REPT, a practical system that enables reverse debugging of software failures in deployed systems. REPT reconstructs the execution history with high fidelity by combining online lightweight hardware tracing of a program's control flow with offline binary analysis that recovers its data flow. It is seemingly impossible to recover data values thousands of instructions before the failure due to information loss and concurrent execution. REPT tackles these challenges by constructing a partial execution order based on timestamps logged by hardware and iteratively performing forward and backward execution with error correction.

We design and implement REPT, deploy it on Microsoft Windows, and integrate it into Windows Debugger. We evaluate REPT on 16 real-world bugs and show that it can recover data values accurately (92% on average) and efficiently (less than 20 seconds) for these bugs. We also show that it enables effective reverse debugging for 14 bugs.

[AVAILABLE](https://www.usenix.org/conference/osdi18/presentation/weidong)



**<font color=#005493>Finding Crash-Consistency Bugs with Bounded Black-Box Crash Testingn</font>**

Jayashree Mohan, Ashlie Martinez, Soujanya Ponnapalli, and Pandian Raju, *University of Texas at Austin;* Vijay Chidambaram, *University of Texas at Austin and VMware Research*

**Abstract** We present a new approach to testing file-system crash consistency: bounded black-box crash testing (B3). B3 tests the file system in a black-box manner using workloads of file-system operations. Since the space of possible workloads is infinite, B3 bounds this space based on parameters such as the number of file-system operations or which operations to include, and exhaustively generates workloads within this bounded space. Each workload is tested on the target file system by simulating power-loss crashes while the workload is being executed, and checking if the file system recovers to a correct state after each crash. B3 builds upon insights derived from our study of crash-consistency bugs reported in Linux file systems in the last five years. We observed that most reported bugs can be reproduced using small workloads of three or fewer file-system operations on a newly-created file system, and that all reported bugs result from crashes after fsync() related system calls. We build two tools, CrashMonkey and Ace, to demonstrate the effectiveness of this approach. Our tools are able to find 24 out of the 26 crash-consistency bugs reported in the last five years. Our tools also revealed 10 new crash-consistency bugs in widely-used, mature Linux file systems, seven of which existed in the kernel since 2014. The new bugs result in severe consequences like broken rename atomicity and loss of persisted files.

[AVAILABLE](https://www.usenix.org/conference/osdi18/presentation/mohan)



**<font color=#005493>An Analysis of Network-Partitioning Failures in Cloud Systems</font>**

Ahmed Alquraan, Hatem Takruri, Mohammed Alfatafta, and Samer Al-Kiswany, *University of Waterloo*

**Abstract** We present a comprehensive study of 136 system failures attributed to network-partitioning faults from 25 widely used distributed systems. We found that the majority of the failures led to catastrophic effects, such as data loss, reappearance of deleted data, broken locks, and system crashes. The majority of the failures can easily manifest once a network partition occurs: They require little to no client input, can be triggered by isolating a single node, and are deterministic. However, the number of test cases that one must consider is extremely large. Fortunately, we identify ordering, timing, and network fault characteristics that significantly simplify testing. Furthermore, we found that a significant number of the failures are due to design flaws in core system mechanisms. We found that the majority of the failures could have been avoided by design reviews, and could have been discovered by testing with network-partitioning fault injection. We built NEAT, a testing framework that simplifies the coordination of multiple clients and can inject different types of network-partitioning faults. We used NEAT to test seven popular systems and found and reported 32 failures.

[AVAILABLE](https://www.usenix.org/conference/osdi18/presentation/alquraan)



### Operating Systems

**<font color=#005493>LegoOS: A Disseminated, Distributed OS for Hardware Resource Disaggregation</font>**

Yizhou Shan, Yutong Huang, Yilun Chen, and Yiying Zhang, *Purdue University*

**Abstract** The monolithic server model where a server is the unit of deployment, operation, and failure is meeting its limits in the face of several recent hardware and application trends. To improve heterogeneity, elasticity, resource utilization, and failure handling in datacenters, we believe that datacenters should break monolithic servers into disaggregated, network-attached hardware components. Despite the promising benefits of hardware resource disaggregation, no existing OSes or software systems can properly manage it. We propose a new OS model called the splitkernel to manage disaggregated systems. Splitkernel disseminates traditional OS functionalities into loosely-coupled monitors, each of which runs on and manages a hardware component. Using the splitkernel model, we built LegoOS, a new OS designed for hardware resource disaggregation. LegoOS appears to users as a set of distributed servers. Internally, LegoOS cleanly separates processor, memory, and storage devices both at the hardware level and the OS level. We implemented LegoOS from scratch and evaluated it by emulating hardware components using commodity servers. Our evaluation results show that LegoOS’s performance is comparable to monolithic Linux servers, while largely improving resource packing and failure rate over monolithic clusters.



**<font color=#005493>The benefits and costs of writing a POSIX kernel in a high-level language</font>**

Cody Cutler, M. Frans Kaashoek, and Robert T. Morris, MIT CSAIL

**Abstract** This paper presents an evaluation of the use of a high-level language (HLL) with garbage collection to implement a monolithic POSIX-style kernel. The goal is to explore if it is reasonable to use an HLL instead of C for such kernels, by examining performance costs, implementation challenges, and programmability and safety benefits.

The paper contributes Biscuit, a kernel written in Go that implements enough of POSIX (virtual memory, mmap, TCP/IP sockets, a logging file system, poll, etc.) to execute significant applications. Biscuit makes lib- eral use of Go's HLL features (closures, channels, maps, interfaces, garbage collected heap allocation), which sub- jectively made programming easier. The most challenging puzzle was handling the possibility of running out of ker- nel heap memory; Biscuit benefited from the analyzability of Go source to address this challenge.

On a set of kernel-intensive benchmarks (including NG- INX and Redis) the fraction of kernel CPU time Biscuit spends on HLL features (primarily garbage collection and thread stack expansion checks) ranges up to 13%. The longest single GC-related pause suffered by NGINX was 115 microseconds; the longest observed sum of GC delays to a complete NGINX client request was 600 microsec- onds. In experiments comparing nearly identical system call, page fault, and context switch code paths written in Go and C, the Go version was 5% to 15% slower.



**<font color=#005493>Sharing, Protection, and Compatibility for Reconfigurable Fabric with AmorphOS</font>**

Ahmed Khawaja, Joshua Landgraf, and Rohith Prakash, UT Austin; Michael Wei and Eric Schkufza, VMware Research Group; Christopher J. Rossbach, UT Austin and VMware Research Group

**Abstract** Cloud providers such as Amazon and Microsoft have begun to support on-demand FPGA acceleration in the cloud, and hardware vendors will support FPGAs in future processors. At the same time, technology advancements such as 3D stacking, through-silicon vias (TSVs), and FinFETs have greatly increased FPGA density. The massive parallelism of current FPGAs can support not only extremely large applications, but multiple applications simultaneously as well.

System support for FPGAs, however, is in its infancy. Unlike software, where resource configurations are limited to simple dimensions of compute, memory, and I/O, FPGAs provide a multi-dimensional sea of resources known as the FPGA fabric: logic cells, floating point units, memories, and I/O can all be wired together, leading to spatial constraints on FPGA resources. Current stacks either support only a single application or statically partition the FPGA fabric into fixed-size slots. These designs cannot efficiently support diverse workloads: the size of the largest slot places an artificial limit on application size, and oversized slots result in wasted FPGA resources and reduced concurrency.

This paper presents AmorphOS, which encapsulates user FPGA logic in morphable tasks, or Morphlets. Morphlets provide isolation and protection across mutually distrustful protection domains, extending the guarantees of software processes. Morphlets can morph, dynamically altering their deployed form based on resource requirements and availability. To build Morphlets, developers provide a parameterized hardware design that interfaces with AmorphOS, along with a mesh, which specifies external resource requirements. AmorphOS explores the parameter space, generating deployable Morphlets of varying size and resource requirements. AmorphOS multiplexes Morphlets on the FPGA in both space and time to maximize FPGA utilization.

We implement AmorphOS on Amazon F1 and Microsoft Catapult. We show that protected sharing and dynamic scalability support on workloads such as DNN inference and blockchain mining improves aggregate throughput up to 4x and 23x on Catapult and F1 respectively.



**<font color=#005493>Adaptive Dynamic Checkpointing for Safe Efficient Intermittent Computing</font>**

Kiwan Maeng and Brandon Lucia, Carnegie Mellon University

**Abstract** Energy-harvesting devices have the potential to be the foundation of emerging, sensor-rich application domains where the use of batteries is infeasible, such as in space and civil infrastructure. Programming on an energy-harvesting device is difficult because the device operates only intermittently, as energy is available. Intermittent operation requires the programmer to reason about energy to understand data consistency and forward progress of their program. Energy varies with input and environment, making intermittent programming difficult. Existing systems for intermittent execution provide an unfamiliar programming abstraction and fail to adapt to energy changes forcing a compromise of either performance or assurance of forward progress. This paper presents Chinchilla, a compiler and runtime system that allows running unmodified C code efficiently on an energy-harvesting device with little additional programmer effort and no additional hardware support. Chinchilla overprovisions code with checkpoints to assure the system makes progress, even with scarce energy. Chinchilla disables checkpoints dynamically to efficiently adapt to energy conditions. Experiments show that Chinchilla improves programmability, is performant, and makes it simple to statically check the absence of non-termination. Comparing to two systems from prior work, Alpaca and Ratchet, Chinchilla makes progress when Alpaca cannot, and has 125% mean speedup against Ratchet.



### Scheduling
Session Chair: Christos Kozyrakis, Stanford University

**<font color=#005493>Arachne: Core-Aware Thread Management</font>**

Henry Qin, Qian Li, Jacqueline Speiser, Peter Kraft, and John Ousterhout, Stanford University

Arachne is a new user-level implementation of threads that provides both low latency and high throughput for applications with extremely short-lived threads (only a few microseconds). Arachne is core-aware: each application determines how many cores it needs, based on its load; it always knows exactly which cores it has been allocated, and it controls the placement of its threads on those cores. A central core arbiter allocates cores between applications. Adding Arachne to memcached improved SLO-compliant throughput by 37%, reduced tail latency by more than 10x, and allowed memcached to coexist with background applications with almost no performance impact. Adding Arachne to the RAMCloud storage system increased its write throughput by more than 2.5x. The Arachne threading library is optimized to minimize cache misses; it can initiate a new user thread on a different core (with load balancing) in 320 ns. Arachne is implemented entirely at user level on Linux; no kernel modifications are needed.

**<font color=#005493>Principled Schedulability Analysis for Distributed Storage Systems using Thread Architecture Models</font>**

Suli Yang, Ant Financial Services Group; Jing Liu, Andrea C. Arpaci-Dusseau, and Remzi H. Arpaci-Dusseau, UW-Madison

AVAILABLE MEDIA
Hide details  ▾  
In this paper, we present an approach to systematically examine the schedulability of distributed storage systems, identify their scheduling problems, and enable effective scheduling in these systems. We use Thread Architecture Models (TAMs) to describe the behavior and interactions of different threads in a system, and show both how to construct TAMs for existing systems and utilize TAMs to identify critical scheduling problems. We identify five common problems that prevent a system from providing schedulability and show that these problems arise in existing systems such as HBase, Cassandra, MongoDB, and Riak, making it difficult or impossible to realize various scheduling disciplines. We demonstrate how to address these schedulability problems by developing Tamed-HBase and Muzzled-HBase, sets of modifications to HBase that can realize the desired scheduling disciplines, including fairness and priority scheduling, even when presented with challenging workloads.

**<font color=#005493>Adaptive Dynamic Checkpointing for Safe Efficient Intermittent Computing</font>**

µTune: Auto-Tuned Threading for OLDI Microservices
Akshitha Sriraman and Thomas F. Wenisch, University of Michigan

AVAILABLE MEDIA
Hide details  ▾  
Modern On-Line Data Intensive (OLDI) applications have evolved from monolithic systems to instead comprise numerous, distributed microservices interacting via Remote Procedure Calls (RPCs). Microservices face sub-millisecond (sub-ms) RPC latency goals, much tighter than their monolithic counterparts that must meet ≥ 100 ms latency targets. Sub-ms–scale threading and concurrency design effects that were once insignificant for such monolithic services can now come to dominate in the sub-ms–scale microservice regime. We investigate how threading design critically impacts microservice tail latency by developing a taxonomy of threading models—a structured understanding of the implications of how microservices manage concurrency and interact with RPC interfaces under wide-ranging loads. We develop μTune, a system that has two features: (1) a novel framework that abstracts threading model implementation from application code, and (2) an automatic load adaptation system that curtails microservice tail latency by exploiting inherent latency trade-offs revealed in our taxonomy to transition among threading models. We study μTune in the context of four OLDI applications to demonstrate up to 1.9x tail latency improvement over static threading choices and state-of-the-art adaptation techniques.

**<font color=#005493>Adaptive Dynamic Checkpointing for Safe Efficient Intermittent Computing</font>**

RobinHood: Tail Latency Aware Caching -- Dynamic Reallocation from Cache-Rich to Cache-Poor
Daniel S. Berger and Benjamin Berg, Carnegie Mellon University; Timothy Zhu, Pennsylvania State University; Siddhartha Sen, Microsoft Research; Mor Harchol-Balter, Carnegie Mellon University

AVAILABLE MEDIA
Hide details  ▾  
Tail latency is of great importance in user-facing web services. However, maintaining low tail latency is challenging, because a single request to a web application server results in multiple queries to complex, diverse backend services (databases, recommender systems, ad systems, etc.). A request is not complete until all of its queries have completed. We analyze a Microsoft production system and find that backend query latencies vary by more than two orders of magnitude across backends and over time, resulting in high request tail latencies.

We propose a novel solution for maintaining low request tail latency: repurpose existing caches to mitigate the effects of backend latency variability, rather than just caching popular data. Our solution, RobinHood, dynamically reallocates cache resources from the cache-rich (backends which don't affect request tail latency) to the cache-poor (backends which affect request tail latency). We evaluate RobinHood with production traces on a 50-server cluster with 20 different backend systems. Surprisingly, we find that RobinHood can directly address tail latency even if working sets are much larger than the cache size. In the presence of load spikes, RobinHood meets a 150ms P99 goal 99.7% of the time, whereas the next best policy meets this goal only 70% of the time.





----

*   

Available Media

](/conference/osdi18/preview1)](/conference/osdi18/preview1)

Monday, October 8, 2018
-----------------------

### 7:30 am–8:45 am

Continental Breakfast
---------------------

Costa Del Sol Patios

### 8:45 am–9:00 am

Opening Remarks and Jay Lepreau Best Paper Awards
-------------------------------------------------

Program Co-Chairs: Andrea Arpaci-Dusseau, _University of Wisconsin—Madison_, and Geoff Voelker, _University of California, San Diego_

### 9:00 am–10:20 am

Understanding Failures
----------------------

Session Chair: Ranjita Bhagwan, _Microsoft Research India_

[Capturing and Enhancing In Situ System Observability for Failure Detection](/conference/osdi18/presentation/huang)
-------------------------------------------------------------------------------------------------------------------

Peng Huang, _Johns Hopkins University;_ Chuanxiong Guo, _ByteDance Inc.;_ Jacob R. Lorch and Lidong Zhou, _Microsoft Research;_ Yingnong Dang, _Microsoft_

Available Media

[](/conference/osdi18/presentation/huang)](/conference/osdi18/presentation/huang)](/conference/osdi18/presentation/huang)

Real-world distributed systems suffer unavailability due to various types of failure. But, despite enormous effort, many failures, especially gray failures, still escape detection. In this paper, we argue that the missing piece in failure detection is detecting what the requesters of a failing component see. This insight leads us to the design and implementation of Panorama, a system designed to enhance \\emph{system observability} by taking advantage of the interactions between a system's components. By providing a systematic channel and analysis tool, Panorama turns a component into a logical observer so that it not only handles errors, but also \\emph{reports} them. Furthermore, Panorama incorporates techniques for making such observations even when indirection exists between components. Panorama can easily integrate with popular distributed systems and detect all 15 \\emph{real-world} gray failures that we reproduced in less than 7 s, whereas existing approaches detect only one of them in under 300 s.

[REPT: Reverse Debugging of Failures in Deployed Software](/conference/osdi18/presentation/weidong)
---------------------------------------------------------------------------------------------------

Weidong Cui and Xinyang Ge, _Microsoft Research Redmond;_ Baris Kasikci, _University of Michigan;_ Ben Niu, _Microsoft Research Redmond;_ Upamanyu Sharma, _University of Michigan;_ Ruoyu Wang, _Arizona State University;_ Insu Yun, _Georgia Institute of Technology_  
**_Awarded Best Paper!_**

Available Media

[](/conference/osdi18/presentation/weidong)](/conference/osdi18/presentation/weidong)](/conference/osdi18/presentation/weidong)

Debugging software failures in deployed systems is important because they impact real users and customers. However, debugging such failures is notoriously hard in practice because developers have to rely on limited information such as memory dumps. The execution history is usually unavailable because high-fidelity program tracing is not affordable in deployed systems.

In this paper, we present REPT, a practical system that enables reverse debugging of software failures in deployed systems. REPT reconstructs the execution history with high fidelity by combining online lightweight hardware tracing of a program's control flow with offline binary analysis that recovers its data flow. It is seemingly impossible to recover data values thousands of instructions before the failure due to information loss and concurrent execution. REPT tackles these challenges by constructing a partial execution order based on timestamps logged by hardware and iteratively performing forward and backward execution with error correction.

We design and implement REPT, deploy it on Microsoft Windows, and integrate it into Windows Debugger. We evaluate REPT on 16 real-world bugs and show that it can recover data values accurately (92% on average) and efficiently (less than 20 seconds) for these bugs. We also show that it enables effective reverse debugging for 14 bugs.

[Finding Crash-Consistency Bugs with Bounded Black-Box Crash Testing](/conference/osdi18/presentation/mohan)
------------------------------------------------------------------------------------------------------------

Jayashree Mohan, Ashlie Martinez, Soujanya Ponnapalli, and Pandian Raju, _University of Texas at Austin;_ Vijay Chidambaram, _University of Texas at Austin and VMware Research_

Available Media

[](/conference/osdi18/presentation/mohan)](/conference/osdi18/presentation/mohan)](/conference/osdi18/presentation/mohan)

We present a new approach to testing file-system crash consistency: bounded black-box crash testing (B3). B3 tests the file system in a black-box manner using workloads of file-system operations. Since the space of possible workloads is infinite, B3 bounds this space based on parameters such as the number of file-system operations or which operations to include, and exhaustively generates workloads within this bounded space. Each workload is tested on the target file system by simulating power-loss crashes while the workload is being executed, and checking if the file system recovers to a correct state after each crash. B3 builds upon insights derived from our study of crash-consistency bugs reported in Linux file systems in the last five years. We observed that most reported bugs can be reproduced using small workloads of three or fewer file-system operations on a newly-created file system, and that all reported bugs result from crashes after fsync() related system calls. We build two tools, CrashMonkey and Ace, to demonstrate the effectiveness of this approach. Our tools are able to find 24 out of the 26 crash-consistency bugs reported in the last five years. Our tools also revealed 10 new crash-consistency bugs in widely-used, mature Linux file systems, seven of which existed in the kernel since 2014. The new bugs result in severe consequences like broken rename atomicity and loss of persisted files.

### Additional media

*   [Extended version on arXiv](https://arxiv.org/abs/1810.02904)
*   [YouTube Demo](https://www.youtube.com/watch?v=6fiomPVK8o0&feature=youtu.be)





[An Analysis of Network-Partitioning Failures in Cloud Systems](/conference/osdi18/presentation/alquraan)
---------------------------------------------------------------------------------------------------------

Ahmed Alquraan, Hatem Takruri, Mohammed Alfatafta, and Samer Al-Kiswany, _University of Waterloo_

Available Media

[](/conference/osdi18/presentation/alquraan)](/conference/osdi18/presentation/alquraan)](/conference/osdi18/presentation/alquraan)

We present a comprehensive study of 136 system failures attributed to network-partitioning faults from 25 widely used distributed systems. We found that the majority of the failures led to catastrophic effects, such as data loss, reappearance of deleted data, broken locks, and system crashes. The majority of the failures can easily manifest once a network partition occurs: They require little to no client input, can be triggered by isolating a single node, and are deterministic. However, the number of test cases that one must consider is extremely large. Fortunately, we identify ordering, timing, and network fault characteristics that significantly simplify testing. Furthermore, we found that a significant number of the failures are due to design flaws in core system mechanisms. We found that the majority of the failures could have been avoided by design reviews, and could have been discovered by testing with network-partitioning fault injection. We built NEAT, a testing framework that simplifies the coordination of multiple clients and can inject different types of network-partitioning faults. We used NEAT to test seven popular systems and found and reported 32 failures.

### 10:20 am–10:50 am

Break with Refreshments
-----------------------

Costa Del Sol Patios

### 10:50 am–12:10 pm

Operating Systems
-----------------

Session Chair: Don Porter, _The University of North Carolina at Chapel Hill_

[LegoOS: A Disseminated, Distributed OS for Hardware Resource Disaggregation](/conference/osdi18/presentation/shan)
-------------------------------------------------------------------------------------------------------------------

Yizhou Shan, Yutong Huang, Yilun Chen, and Yiying Zhang, _Purdue University_  
**_Awarded Best Paper!_**

Available Media

[](/conference/osdi18/presentation/shan)](/conference/osdi18/presentation/shan)](/conference/osdi18/presentation/shan)

The monolithic server model where a server is the unit of deployment, operation, and failure is meeting its limits in the face of several recent hardware and application trends. To improve heterogeneity, elasticity, resource utilization, and failure handling in datacenters, we believe that datacenters should break monolithic servers into disaggregated, network-attached hardware components. Despite the promising benefits of hardware resource disaggregation, no existing OSes or software systems can properly manage it. We propose a new OS model called the splitkernel to manage disaggregated systems. Splitkernel disseminates traditional OS functionalities into loosely-coupled monitors, each of which runs on and manages a hardware component. Using the splitkernel model, we built LegoOS, a new OS designed for hardware resource disaggregation. LegoOS appears to users as a set of distributed servers. Internally, LegoOS cleanly separates processor, memory, and storage devices both at the hardware level and the OS level. We implemented LegoOS from scratch and evaluated it by emulating hardware components using commodity servers. Our evaluation results show that LegoOS’s performance is comparable to monolithic Linux servers, while largely improving resource packing and failure rate over monolithic clusters.

[The benefits and costs of writing a POSIX kernel in a high-level language](/conference/osdi18/presentation/cutler)
-------------------------------------------------------------------------------------------------------------------

Cody Cutler, M. Frans Kaashoek, and Robert T. Morris, _MIT CSAIL_

Available Media

[](/conference/osdi18/presentation/cutler)](/conference/osdi18/presentation/cutler)](/conference/osdi18/presentation/cutler)

This paper presents an evaluation of the use of a high-level language (HLL) with garbage collection to implement a monolithic POSIX-style kernel. The goal is to explore if it is reasonable to use an HLL instead of C for such kernels, by examining performance costs, implementation challenges, and programmability and safety benefits.

The paper contributes Biscuit, a kernel written in Go that implements enough of POSIX (virtual memory, mmap, TCP/IP sockets, a logging file system, poll, etc.) to execute significant applications. Biscuit makes lib- eral use of Go's HLL features (closures, channels, maps, interfaces, garbage collected heap allocation), which sub- jectively made programming easier. The most challenging puzzle was handling the possibility of running out of ker- nel heap memory; Biscuit benefited from the analyzability of Go source to address this challenge.

On a set of kernel-intensive benchmarks (including NG- INX and Redis) the fraction of kernel CPU time Biscuit spends on HLL features (primarily garbage collection and thread stack expansion checks) ranges up to 13%. The longest single GC-related pause suffered by NGINX was 115 microseconds; the longest observed sum of GC delays to a complete NGINX client request was 600 microsec- onds. In experiments comparing nearly identical system call, page fault, and context switch code paths written in Go and C, the Go version was 5% to 15% slower.

[Sharing, Protection, and Compatibility for Reconfigurable Fabric with AmorphOS](/conference/osdi18/presentation/khawaja)
-------------------------------------------------------------------------------------------------------------------------

Ahmed Khawaja, Joshua Landgraf, and Rohith Prakash, _UT Austin;_ Michael Wei and Eric Schkufza, _VMware Research Group;_ Christopher J. Rossbach, _UT Austin and VMware Research Group_

Available Media

[](/conference/osdi18/presentation/khawaja)](/conference/osdi18/presentation/khawaja)](/conference/osdi18/presentation/khawaja)

Cloud providers such as Amazon and Microsoft have begun to support on-demand FPGA acceleration in the cloud, and hardware vendors will support FPGAs in future processors. At the same time, technology advancements such as 3D stacking, through-silicon vias (TSVs), and FinFETs have greatly increased FPGA density. The massive parallelism of current FPGAs can support not only extremely large applications, but multiple applications simultaneously as well.

System support for FPGAs, however, is in its infancy. Unlike software, where resource configurations are limited to simple dimensions of compute, memory, and I/O, FPGAs provide a multi-dimensional sea of resources known as the FPGA fabric: logic cells, floating point units, memories, and I/O can all be wired together, leading to spatial constraints on FPGA resources. Current stacks either support only a single application or statically partition the FPGA fabric into fixed-size slots. These designs cannot efficiently support diverse workloads: the size of the largest slot places an artificial limit on application size, and oversized slots result in wasted FPGA resources and reduced concurrency.

This paper presents AmorphOS, which encapsulates user FPGA logic in morphable tasks, or Morphlets. Morphlets provide isolation and protection across mutually distrustful protection domains, extending the guarantees of software processes. Morphlets can morph, dynamically altering their deployed form based on resource requirements and availability. To build Morphlets, developers provide a parameterized hardware design that interfaces with AmorphOS, along with a mesh, which specifies external resource requirements. AmorphOS explores the parameter space, generating deployable Morphlets of varying size and resource requirements. AmorphOS multiplexes Morphlets on the FPGA in both space and time to maximize FPGA utilization.

We implement AmorphOS on Amazon F1 and Microsoft Catapult. We show that protected sharing and dynamic scalability support on workloads such as DNN inference and blockchain mining improves aggregate throughput up to 4x and 23x on Catapult and F1 respectively.

[Adaptive Dynamic Checkpointing for Safe Efficient Intermittent Computing](/conference/osdi18/presentation/maeng)
-----------------------------------------------------------------------------------------------------------------

Kiwan Maeng and Brandon Lucia, _Carnegie Mellon University_

Available Media

[](/conference/osdi18/presentation/maeng)](/conference/osdi18/presentation/maeng)

Energy-harvesting devices have the potential to be the foundation of emerging, sensor-rich application domains where the use of batteries is infeasible, such as in space and civil infrastructure. Programming on an energy-harvesting device is difficult because the device operates only intermittently, as energy is available. Intermittent operation requires the programmer to reason about energy to understand data consistency and forward progress of their program. Energy varies with input and environment, making intermittent programming difficult. Existing systems for intermittent execution provide an unfamiliar programming abstraction and fail to adapt to energy changes forcing a compromise of either performance or assurance of forward progress. This paper presents Chinchilla, a compiler and runtime system that allows running unmodified C code efficiently on an energy-harvesting device with little additional programmer effort and no additional hardware support. Chinchilla overprovisions code with checkpoints to assure the system makes progress, even with scarce energy. Chinchilla disables checkpoints dynamically to efficiently adapt to energy conditions. Experiments show that Chinchilla improves programmability, is performant, and makes it simple to statically check the absence of non-termination. Comparing to two systems from prior work, Alpaca and Ratchet, Chinchilla makes progress when Alpaca cannot, and has 125% mean speedup against Ratchet.

### 12:10 pm–2:00 pm

Symposium Luncheon
------------------

_Sponsored by Google_  
Costa Del Sol Patios

### 2:00 pm–3:20 pm

Scheduling
----------

Session Chair: Christos Kozyrakis, _Stanford University_

[Arachne: Core-Aware Thread Management](/conference/osdi18/presentation/qin)
----------------------------------------------------------------------------

Henry Qin, Qian Li, Jacqueline Speiser, Peter Kraft, and John Ousterhout, _Stanford University_

Available Media

[](/conference/osdi18/presentation/qin)](/conference/osdi18/presentation/qin)](/conference/osdi18/presentation/qin)

Arachne is a new user-level implementation of threads that provides both low latency and high throughput for applications with extremely short-lived threads (only a few microseconds). Arachne is _core-aware_: each application determines how many cores it needs, based on its load; it always knows exactly which cores it has been allocated, and it controls the placement of its threads on those cores. A central core arbiter allocates cores between applications. Adding Arachne to memcached improved SLO-compliant throughput by 37%, reduced tail latency by more than 10x, and allowed memcached to coexist with background applications with almost no performance impact. Adding Arachne to the RAMCloud storage system increased its write throughput by more than 2.5x. The Arachne threading library is optimized to minimize cache misses; it can initiate a new user thread on a different core (with load balancing) in 320 ns. Arachne is implemented entirely at user level on Linux; no kernel modifications are needed.

[Principled Schedulability Analysis for Distributed Storage Systems using Thread Architecture Models](/conference/osdi18/presentation/yang)
-------------------------------------------------------------------------------------------------------------------------------------------

Suli Yang, _Ant Financial Services Group;_ Jing Liu, Andrea C. Arpaci-Dusseau, and Remzi H. Arpaci-Dusseau, _UW-Madison_

Available Media

[](/conference/osdi18/presentation/yang)](/conference/osdi18/presentation/yang)](/conference/osdi18/presentation/yang)

In this paper, we present an approach to systematically examine the _schedulability_ of distributed storage systems, identify their scheduling problems, and enable effective scheduling in these systems. We use _Thread Architecture Models (TAMs)_ to describe the behavior and interactions of different threads in a system, and show both how to construct TAMs for existing systems and utilize TAMs to identify critical scheduling problems. We identify five common problems that prevent a system from providing schedulability and show that these problems arise in existing systems such as HBase, Cassandra, MongoDB, and Riak, making it difficult or impossible to realize various scheduling disciplines. We demonstrate how to address these schedulability problems by developing Tamed-HBase and Muzzled-HBase, sets of modifications to HBase that can realize the desired scheduling disciplines, including fairness and priority scheduling, even when presented with challenging workloads.

[µTune: Auto-Tuned Threading for OLDI Microservices](/conference/osdi18/presentation/sriraman)
----------------------------------------------------------------------------------------------

Akshitha Sriraman and Thomas F. Wenisch, _University of Michigan_

Available Media

[](/conference/osdi18/presentation/sriraman)](/conference/osdi18/presentation/sriraman)](/conference/osdi18/presentation/sriraman)

Modern On-Line Data Intensive (OLDI) applications have evolved from monolithic systems to instead comprise numerous, distributed microservices interacting via Remote Procedure Calls (RPCs). Microservices face sub-millisecond (sub-ms) RPC latency goals, much tighter than their monolithic counterparts that must meet ≥ 100 ms latency targets. Sub-ms–scale threading and concurrency design effects that were once insignificant for such monolithic services can now come to dominate in the sub-ms–scale microservice regime. We investigate how threading design critically impacts microservice tail latency by developing a taxonomy of threading models—a structured understanding of the implications of how microservices manage concurrency and interact with RPC interfaces under wide-ranging loads. We develop μTune, a system that has two features: (1) a novel framework that abstracts threading model implementation from application code, and (2) an automatic load adaptation system that curtails microservice tail latency by exploiting inherent latency trade-offs revealed in our taxonomy to transition among threading models. We study μTune in the context of four OLDI applications to demonstrate up to 1.9x tail latency improvement over static threading choices and state-of-the-art adaptation techniques.

[RobinHood: Tail Latency Aware Caching -- Dynamic Reallocation from Cache-Rich to Cache-Poor](/conference/osdi18/presentation/berger)
-------------------------------------------------------------------------------------------------------------------------------------

Daniel S. Berger and Benjamin Berg, _Carnegie Mellon University;_ Timothy Zhu, _Pennsylvania State University;_ Siddhartha Sen, _Microsoft Research;_ Mor Harchol-Balter, _Carnegie Mellon University_

Available Media

[](/conference/osdi18/presentation/berger)](/conference/osdi18/presentation/berger)](/conference/osdi18/presentation/berger)

Tail latency is of great importance in user-facing web services. However, maintaining low tail latency is challenging, because a single request to a web application server results in multiple queries to complex, diverse backend services (databases, recommender systems, ad systems, etc.). A request is not complete until all of its queries have completed. We analyze a Microsoft production system and find that backend query latencies vary by more than two orders of magnitude across backends and over time, resulting in high request tail latencies.

We propose a novel solution for maintaining low request tail latency: repurpose existing caches to mitigate the effects of backend latency variability, rather than just caching popular data. Our solution, RobinHood, dynamically reallocates cache resources from the cache-rich (backends which don't affect request tail latency) to the cache-poor (backends which affect request tail latency). We evaluate RobinHood with production traces on a 50-server cluster with 20 different backend systems. Surprisingly, we find that RobinHood can directly address tail latency even if working sets are much larger than the cache size. In the presence of load spikes, RobinHood meets a 150ms P99 goal 99.7% of the time, whereas the next best policy meets this goal only 70% of the time.

### 3:20 pm–3:50 pm

Break with Refreshments
-----------------------

_Sponsored by Microsoft_  
Costa Del Sol Patios

### 3:50 pm–5:10 pm

Data
----

Session Chair: Irene Zhang, _Microsoft Research_

[Noria: dynamic, partially-stateful data-flow for high-performance web applications](/conference/osdi18/presentation/gjengset)
------------------------------------------------------------------------------------------------------------------------------

Jon Gjengset, Malte Schwarzkopf, Jonathan Behrens, and Lara Timbó Araújo, _MIT CSAIL;_ Martin Ek, _Norwegian University of Science and Technology;_ Eddie Kohler, _Harvard University;_ M. Frans Kaashoek and Robert Morris, _MIT CSAIL_

Available Media

[](/conference/osdi18/presentation/gjengset)](/conference/osdi18/presentation/gjengset)](/conference/osdi18/presentation/gjengset)

We introduce _partially-stateful data-flow_, a new streaming data-flow model that supports eviction and reconstruction of data-flow state on demand. By avoiding state explosion and supporting live changes to the data-flow graph, this model makes data-flow viable for building long-lived, low-latency applications, such as web applications. Our implementation, _Noria_, simplifies the backend infrastructure for read-heavy web applications while improving their performance.

A Noria application supplies a relational schema and a set of parameterized queries, which Noria compiles into a data-flow program that pre-computes results for reads and incrementally applies writes. Noria makes it easy to write high-performance applications without manual performance tuning or complex-to-maintain caching layers. Partial statefulness helps Noria limit its in-memory state without prior data-flow systems’ restriction to windowed state, and helps Noria adapt its data-flow to schema and query changes while on-line. Unlike prior data-flow systems, Noria also shares state and computation across related queries, eliminating duplicate work.

On a real web application’s queries, our prototype scales to 5× higher load than a hand-optimized MySQL baseline. Noria also outperforms a typical MySQL/memcached stack and the materialized views of a commercial database. It scales to tens of millions of reads and millions of writes per second over multiple servers, outperforming a state-of-the-art streaming data-flow system.

[Deconstructing RDMA-enabled Distributed Transactions: Hybrid is Better!](/conference/osdi18/presentation/wei)
--------------------------------------------------------------------------------------------------------------

Xingda Wei, Zhiyuan Dong, Rong Chen, and Haibo Chen, _Shanghai Jiao Tong University_

Available Media

[](/conference/osdi18/presentation/wei)](/conference/osdi18/presentation/wei)](/conference/osdi18/presentation/wei)

There is currently an active debate on which RDMA primitive (i.e., one-sided or two-sided) is optimal for distributed transactions. Such a debate has led to a number of optimizations based on one RDMA primitive, which was shown with better performance than the other. In this paper, we perform a systematic comparison be- tween different RDMA primitives with a combination of various optimizations using representative OLTP workloads. More specifically, we first implement and compare different RDMA primitives with existing and our new optimizations upon a single well-tuned execution framework. This gives us insights into the performance characteristics of different RDMA primitives. Then we investigate the implementation of optimistic concurrency control (OCC) by comparing different RDMA primitives using a phase-by-phase approach with various transactions from TPC-C, SmallBank, and TPC-E. Our results show that no single primitive (one-sided or two-sided) wins over the other on all phases. We further conduct an end-to-end comparison of prior designs on the same codebase and find none of them is optimal. Based on the above studies, we build DrTM+H, a new hybrid distributed transaction system that always embraces the optimal RDMA primitives at each phase of transactional execution. Evaluations using popular OLTP workloads including TPC-C and SmallBank show that DrTM+H achieves over 7.3 and 90.4 million transactions per second on a 16-node RDMA-capable cluster (ConnectX-4) respectively, without locality assumption. This number outperforms the pure one-sided and two- sided systems by up to 1.89X and 2.96X for TPC-C with over 49% and 65% latency reduction. Further, DrTM+H scales well with a large number of connections on modern RDMA network.

[Dynamic Query Re-Planning using QOOP](/conference/osdi18/presentation/mahajan)
-------------------------------------------------------------------------------

Kshiteej Mahajan, _UW-Madison;_ Mosharaf Chowdhury, _U. Michigan;_ Aditya Akella and Shuchi Chawla, _UW-Madison_

Available Media

[](/conference/osdi18/presentation/mahajan)](/conference/osdi18/presentation/mahajan)](/conference/osdi18/presentation/mahajan)

Modern data processing clusters are highly dynamic -- both in terms of the number of concurrently running jobs and their resource usage. To improve job performance, recent works have focused on optimizing the cluster scheduler and the jobs' query planner with a focus on picking the right query execution plan (QEP) -- represented as a directed acyclic graph -- for a job in a resource-aware manner, and scheduling jobs in a QEP-aware manner. However, because existing solutions use a fixed QEP throughout the entire execution, the inability to adapt a QEP in reaction to resource changes often leads to large performance inefficiencies.

This paper argues for dynamic query re-planning, wherein we re-evaluate and re-plan a job's QEP during its execution. We show that designing for re-planning requires fundamental changes to the interfaces between key layers of data analytics stacks today, i.e., the query planner, the execution engine, and the cluster scheduler. Instead of pushing more complexity into the scheduler or the query planner, we argue for a redistribution of responsibilities between the three components to simplify their designs. Under this redesign, we analytically show that a greedy algorithm for re-planning and execution alongside a simple max-min fair scheduler can offer provably competitive behavior even under adversarial resource changes. We prototype our algorithms atop Apache Hive and Tez. Via extensive experiments, we show that our design can offer a median performance improvement of 1.47x compared to state-of-the-art alternatives.

[Focus: Querying Large Video Datasets with Low Latency and Low Cost](/conference/osdi18/presentation/hsieh)
-----------------------------------------------------------------------------------------------------------

Kevin Hsieh, _Carnegie Mellon University;_ Ganesh Ananthanarayanan and Peter Bodik, _Microsoft;_ Shivaram Venkataraman, _Microsoft / UW-Madison;_ Paramvir Bahl and Matthai Philipose, _Microsoft;_ Phillip B. Gibbons, _Carnegie Mellon University;_ Onur Mutlu, _ETH Zurich_

Available Media

[](/conference/osdi18/presentation/hsieh)](/conference/osdi18/presentation/hsieh)](/conference/osdi18/presentation/hsieh)

Large volumes of videos are continuously recorded from cameras deployed for traffic control and surveillance with the goal of answering “after the fact” queries: identify video frames with objects of certain classes (cars, bags) from many days of recorded video. Current systems for processing such queries on large video datasets incur either high cost at video ingest time or high latency at query time. We present Focus, a system providing both low-cost and low-latency querying on large video datasets. Focus’s architecture flexibly and effectively divides the query processing work between ingest time and query time. At ingest time (on live videos), Focus uses cheap convolutional network classifiers (CNNs) to construct an approximate index of all possible object classes in each frame (to handle queries for any class in the future). At query time, Focus leverages this approximate index to provide low latency, but compensates for the lower accuracy of the cheap CNNs through the judicious use of an expensive CNN. Experiments on commercial video streams show that Focus is 48× (up to 92×) cheaper than using expensive CNNs for ingestion, and provides 125× (up to 607×) lower query latency than a state-of-the-art video querying system (NoScope).

### 6:00 pm–7:30 pm

Poster Session and Reception I
------------------------------

Costa Del Sol Foyer and Salon A–C

Check out the cool new ideas and the latest preliminary research on display at the Poster Sessions and Receptions. Take part in discussions with your colleagues over complimentary food and drinks. View the [list of accepted posters](/conference/osdi18/poster-sessions).

### 7:30 pm–8:30 pm

Preview Session 2
-----------------

Are you new to OSDI? Are you a networks expert but feel bewildered when talk turns to security? Are you interested in engaging more deeply with paper presentations outside your research area? Join us for the OSDI preview sessions, where area experts will give short introductions to the symposium's major technical sessions.

*   **Verification:** Jay Lorch, _Microsoft Research_
*   **File Systems:** Steve Swanson, _University of California, San Diego_
*   **Debugging:** Xu Zhao, _University of Toronto_

Available Media

](/conference/osdi18/presentation/preview2)

Tuesday, October 9, 2018
------------------------

### 8:00 am–9:00 am

Continental Breakfast
---------------------

Costa Del Sol Patios

### 9:00 am–10:20 am

Verification
------------

Session Chair: Jon Howell, _VMware Research_

[Nickel: A Framework for Design and Verification of Information Flow Control Systems](/conference/osdi18/presentation/sigurbjarnarson)
--------------------------------------------------------------------------------------------------------------------------------------

Helgi Sigurbjarnarson, Luke Nelson, Bruno Castro-Karney, James Bornholt, Emina Torlak, and Xi Wang, _University of Washington_

Available Media

[](/conference/osdi18/presentation/sigurbjarnarson)](/conference/osdi18/presentation/sigurbjarnarson)

Nickel is a framework that helps developers design and verify information flow control systems by systematically eliminating covert channels inherent in the interface, which can be exploited to circumvent the enforcement of information flow policies. Nickel provides a formulation of noninterference amenable to automated verification, allowing developers to specify an intended policy of permitted information flows. It invokes the Z3 SMT solver to verify that both an interface specification and an implementation satisfy noninterference with respect to the policy; if verification fails, it generates counterexamples to illustrate covert channels that cause the violation.

Using Nickel, we have designed, implemented, and verified NiStar, the first OS kernel for decentralized information flow control that provides (1) a precise specification for its interface, (2) a formal proof that the interface specification is free of covert channels, and (3) a formal proof that the implementation preserves noninterference. We have also applied Nickel to verify isolation in a small OS kernel, NiKOS, and reproduce known covert channels in the ARINC 653 avionics standard. Our experience shows that Nickel is effective in identifying and ruling out covert channels, and that it can verify noninterference for systems with a low proof burden.

[Verifying concurrent software using movers in CSPEC](/conference/osdi18/presentation/chajed)
---------------------------------------------------------------------------------------------

Tej Chajed and Frans Kaashoek, _MIT CSAIL;_ Butler Lampson, _Microsoft;_ Nickolai Zeldovich, _MIT CSAIL_

Available Media

[](/conference/osdi18/presentation/chajed)](/conference/osdi18/presentation/chajed)](/conference/osdi18/presentation/chajed)

Writing concurrent systems software is error-prone, because multiple processes or threads can interleave in many ways, and it is easy to forget about a subtle corner case. This paper introduces CSPEC, a framework for formal verification of concurrent software, which ensures that no corner cases are missed. The key challenge is to reduce the number of interleavings that developers must consider. CSPEC uses mover types to re-order commutative operations so that usually it's enough to reason about only sequential executions rather than all possible interleavings. CSPEC also makes proofs easier by making them modular using layers, and by providing a library of reusable proof patterns. To evaluate CSPEC, we implemented and proved the correctness of CMAIL, a simple concurrent Maildir-like mail server that speaks SMTP and POP3. The results demonstrate that CSPEC's movers and patterns allow reasoning about sophisticated concurrency styles in CMAIL.

[Proving confidentiality in a file system using DiskSec](/conference/osdi18/presentation/ileri)
-----------------------------------------------------------------------------------------------

Atalay Ileri, Tej Chajed, Adam Chlipala, Frans Kaashoek, and Nickolai Zeldovich, _MIT CSAIL_

Available Media

[](/conference/osdi18/presentation/ileri)](/conference/osdi18/presentation/ileri)](/conference/osdi18/presentation/ileri)

SFSCQ is the first file system with a machine-checked proof of security. To develop, specify, and prove SFSCQ, this paper introduces DiskSec, a novel approach for reasoning about confidentiality of storage systems, such as a file system. DiskSec addresses the challenge of specifying confidentiality using the notion of _data noninterference_ to find a middle ground between strong and precise information-flow-control guarantees and the weaker but more practical discretionary access control. DiskSec factors out reasoning about confidentiality from other properties (such as functional correctness) using a notion of _sealed blocks_. Sealed blocks enforce that the file system treats confidential file blocks as opaque in the bulk of the code, greatly reducing the effort of proving data noninterference. An evaluation of SFSCQ shows that its theorems preclude security bugs that have been found in real file systems, that DiskSec imposes little performance overhead, and that SFSCQ's incremental development effort, on top of DiskSec and DFSCQ, on which it is based, is moderate.

[Proving the correct execution of concurrent services in zero-knowledge](/conference/osdi18/presentation/setty)
---------------------------------------------------------------------------------------------------------------

Srinath Setty, _Microsoft Research;_ Sebastian Angel, _University of Pennsylvania;_ Trinabh Gupta, _Microsoft Research and UCSB;_ Jonathan Lee, _Microsoft Research_

Available Media

[](/conference/osdi18/presentation/setty)](/conference/osdi18/presentation/setty)](/conference/osdi18/presentation/setty)

This paper introduces Spice, a system for building verifiable state machines (VSMs). A VSM is a request-processing service that produces proofs establishing that requests were executed correctly according to a specification. Such proofs are succinct (a verifier can check them efficiently without reexecution) and zero-knowledge (a verifier learns nothing about the content of the requests, responses, or the internal state of the service). Recent systems for proving the correct execution of stateful computations---Pantry, Geppetto, CTV, vSQL, etc.---implicitly implement VSMs, but they incur prohibitive costs. Spice reduces these costs significantly with a new storage primitive. More notably, Spice’s storage primitive supports multiple writers, making Spice the first system that can succinctly prove the correct execution of concurrent services. We find that Spice running on a cluster of 16 servers achieves 488--1167 transactions/second for a variety of applications including inter-bank transactions, cloud-hosted ledgers, and dark pools. This represents an 18,000--685,000× higher throughput than prior work.

### 10:20 am–10:50 am

Break with Refreshments
-----------------------

Costa Del Sol Patios

### 10:50 am–12:10 pm

Reliability
-----------

Session Chair: Michael Swift, _University of Wisconsin—Madison_

[The FuzzyLog: A Partially Ordered Shared Log](/conference/osdi18/presentation/lockerman)
-----------------------------------------------------------------------------------------

Joshua Lockerman, _Yale University;_ Jose M. Faleiro, _UC Berkeley;_ Juno Kim, _UC San Diego;_ Soham Sankaran, _Cornell University;_ Daniel J. Abadi, _University of Maryland, College Park;_ James Aspnes, _Yale University;_ Siddhartha Sen, _Microsoft Research;_ Mahesh Balakrishnan, _Yale University / Facebook_

Available Media

[](/conference/osdi18/presentation/lockerman)](/conference/osdi18/presentation/lockerman)](/conference/osdi18/presentation/lockerman)

The FuzzyLog is a partially ordered shared log abstraction. Distributed applications can concurrently append to the partial order and play it back. FuzzyLog applications obtain the benefits of an underlying shared log – extracting strong consistency, durability, and failure atomicity in simple ways – without suffering from its drawbacks. By exposing a partial order, the FuzzyLog enables three key capabilities for applications: linear scaling for throughput and capacity (without sacrificing atomicity), weaker consistency guarantees, and tolerance to network partitions. We present Dapple, a distributed implementation of the FuzzyLog abstraction that stores the partial order compactly and supports efficient appends / playback via a new ordering protocol. We implement several data structures and applications over the FuzzyLog, including several map variants as well as a ZooKeeper implementation. Our evaluation shows that these applications are compact, fast, and flexible: they retain the simplicity (100s of lines of code) and strong semantics (durability and failure atomicity) of a shared log design while exploiting the partial order of the Fuzzy-Log for linear scalability, flexible consistency guarantees (e.g., causal+ consistency), and network partition tolerance. On a 6-node Dapple deployment, our FuzzyLog- based ZooKeeper supports 3M/sec single-key writes, and 150K/sec atomic cross-shard renames.

[Maelstrom: Mitigating Datacenter-level Disasters by Draining Interdependent Traffic Safely and Efficiently](/conference/osdi18/presentation/veeraraghavan)
-----------------------------------------------------------------------------------------------------------------------------------------------------------

Kaushik Veeraraghavan, Justin Meza, Scott Michelson, Sankaralingam Panneerselvam, Alex Gyori, David Chou, Sonia Margulis, Daniel Obenshain, Shruti Padmanabha, Ashish Shah, and Yee Jiun Song, _Facebook;_ Tianyin Xu, _Facebook and University of Illinois at Urbana-Champaign_

Available Media

[](/conference/osdi18/presentation/veeraraghavan)](/conference/osdi18/presentation/veeraraghavan)](/conference/osdi18/presentation/veeraraghavan)

We present Maelstrom, a new system for mitigating and recovering from datacenter-level disasters. Maelstrom provides a traffic management framework with modular, reusable primitives that can be composed to safely and efficiently drain the traffic of interdependent services from one or more failing datacenters to the healthy ones.

Maelstrom ensures safety by encoding inter-service dependencies and resource constraints. Maelstrom uses health monitoring to implement feedback control so that all specified constraints are satisfied by the traffic drains and recovery procedures executed during disaster mitigation. Maelstrom exploits parallelism to drain and restore independent traffic sources efficiently.

We verify the correctness of Maelstrom’s disaster mitigation and recovery procedures by running large-scale tests that drain production traffic from entire datacenters and then restore the traffic back to the datacenters. These tests (termed drain tests) help us gain a deep understand- ing of our complex systems, and provide a venue for continually improving the reliability of our infrastructure. Maelstrom has been in production at Facebook for more than four years, and has been successfully used to mitigate and recover from 100+ datacenter outages.

[Fault-Tolerance, Fast and Slow: Exploiting Failure Asynchrony in Distributed Systems](/conference/osdi18/presentation/alagappan)
---------------------------------------------------------------------------------------------------------------------------------

Ramnatthan Alagappan, Aishwarya Ganesan, Jing Liu, Andrea Arpaci-Dusseau, and Remzi Arpaci-Dusseau, _University of Wisconsin - Madison_

Available Media

[](/conference/osdi18/presentation/alagappan)](/conference/osdi18/presentation/alagappan)](/conference/osdi18/presentation/alagappan)

We introduce situation-aware updates and crash recovery (SAUCR), a new approach to performing replicated data updates in a distributed system. SAUCR adapts the update protocol to the current situation: with many nodes up, SAUCR buffers updates in memory; when failures arise, SAUCR flushes updates to disk. This situation-awareness enables SAUCR to achieve high performance while offering strong durability and availability guarantees. We implement a prototype of SAUCR in ZooKeeper. Through rigorous crash testing, we demonstrate that SAUCR significantly improves durability and availability compared to systems that always write only to memory. We also show that SAUCR’s reliability improvements come at little or no cost: SAUCR’s overheads are within 0%-9% of a purely memory-based system.

[Taming Performance Variability](/conference/osdi18/presentation/maricq)
------------------------------------------------------------------------

Aleksander Maricq and Dmitry Duplyakin, _University of Utah;_ Ivo Jimenez and Carlos Maltzahn, _University of California Santa Cruz;_ Ryan Stutsman and Robert Ricci, _University of Utah_

Available Media

[](/conference/osdi18/presentation/maricq)](/conference/osdi18/presentation/maricq)

The performance of compute hardware varies: software run repeatedly on the same server (or a different server with supposedly identical parts) can produce performance results that differ with each execution. This variation has important effects on the reproducibility of systems research and ability to quantitatively compare the performance of different systems. It also has implications for commercial computing, where agreements are often made conditioned on meeting specific performance targets.

Over a period of 10 months, we conducted a large-scale study capturing nearly 900,000 data points from 835 servers. We examine this data from two perspectives: that of a service provider wishing to offer a consistent environment, and that of a systems researcher who must understand how variability impacts experimental results. From this examination, we draw a number of lessons about the types and magnitudes of performance variability and the effects on confidence in experiment results. We also create a statistical model that can be used to understand how representative an individual server is of the general population. The full dataset and our analysis tools are publicly available, and we have built a system to interactively explore the data and make recommendations for experiment parameters based on statistical analysis of historical data.

### 12:10 pm–12:25 pm

ACM SIGOPS Awards Presentation
------------------------------

### 12:25 pm–2:00 pm

Symposium Luncheon
------------------

Costa Del Sol Patios

### 2:00 pm–3:20 pm

File Systems
------------

Session Chair: Haryadi Gunawi, _University of Chicago_

[Pocket: Elastic Ephemeral Storage for Serverless Analytics](/conference/osdi18/presentation/klimovic)
------------------------------------------------------------------------------------------------------

Ana Klimovic and Yawen Wang, _Stanford University;_ Patrick Stuedi, Animesh Trivedi, and Jonas Pfefferle, _IBM Research;_ Christos Kozyrakis, _Stanford University_

Available Media

[](/conference/osdi18/presentation/klimovic)](/conference/osdi18/presentation/klimovic)](/conference/osdi18/presentation/klimovic)

Serverless computing is becoming increasingly popular, enabling users to quickly launch thousands of shortlived tasks in the cloud with high elasticity and fine-grain billing. These properties make serverless computing appealing for interactive data analytics. However exchanging intermediate data between execution stages in an analytics job is a key challenge as direct communication between serverless tasks is difficult. The natural approach is to store such ephemeral data in a remote data store. However, existing storage systems are not designed to meet the demands of serverless applications in terms of elasticity, performance, and cost. We present Pocket, an elastic, distributed data store that automatically scales to provide applications with desired performance at low cost. Pocket dynamically rightsizes resources across multiple dimensions (CPU cores, network bandwidth, storage capacity) and leverages multiple storage technologies to minimize cost while ensuring applications are not bottlenecked on I/O. We show that Pocket achieves similar performance to ElastiCache Redis for serverless analytics applications while reducing cost by almost 60%.

[Sharding the Shards: Managing Datastore Locality at Scale with Akkio](/conference/osdi18/presentation/annamalai)
-----------------------------------------------------------------------------------------------------------------

Muthukaruppan Annamalai, Kaushik Ravichandran, Harish Srinivas, Igor Zinkovsky, Luning Pan, Tony Savor, and David Nagle, _Facebook;_ Michael Stumm, _University of Toronto_

Available Media

[](/conference/osdi18/presentation/annamalai)](/conference/osdi18/presentation/annamalai)](/conference/osdi18/presentation/annamalai)

Akkio is a locality management service layered between client applications and distributed datastore systems. It determines how and when to migrate data to reduce response times and resource usage. Akkio primarily targets multi-datacenter geo-distributed datastore systems. Its design was motivated by the observation that many of Facebook's frequently accessed datasets have low R/W ratios that are not well served by distributed caches or full replication. Akkio's unit of migration is called a u-shard. Each u-shard is designed to contain related data with some degree of access locality. At Facebook u-shards have become a first-class abstraction.

Akkio went into production at Facebook in 2014, and it currently manages over 100PB of data. Measurements from our production environment show that Akkio reduces access latencies by up to 50%, cross-datacenter traffic by up to 50%, and storage footprint by up to 40% compared to reasonable alternatives. Akkio is scalable: it can support trillions of u-shards and process many 10's of millions of data access requests per second. And it is portable: it currently supports five datastore systems.

[Write-Optimized and High-Performance Hashing Index Scheme for Persistent Memory](/conference/osdi18/presentation/zuo)
----------------------------------------------------------------------------------------------------------------------

Pengfei Zuo, Yu Hua, and Jie Wu, _Huazhong University of Science and Technology_

Available Media

[](/conference/osdi18/presentation/zuo)](/conference/osdi18/presentation/zuo)](/conference/osdi18/presentation/zuo)

Non-volatile memory (NVM) as persistent memory is expected to substitute or complement DRAM in memory hierarchy, due to the strengths of non-volatility, high density, and near-zero standby power. However, due to the requirement of data consistency and hardware limitations of NVM, traditional indexing techniques originally designed for DRAM become inefficient in persistent memory. To efficiently index the data in persistent memory, this paper proposes a write-optimized and high-performance hashing index scheme, called level hashing, with low-overhead consistency guarantee and cost-efficient resizing. Level hashing provides a sharing-based two-level hash table, which achieves a constant-scale search/insertion/deletion/update time complexity in the worst case and rarely incurs extra NVM writes. To guarantee the consistency with low overhead, level hashing leverages log-free consistency schemes for insertion, deletion, and resizing operations, and an opportunistic log-free scheme for update operation. To cost-efficiently resize this hash table, level hashing leverages an in-place resizing scheme that only needs to rehash $1/3$ of buckets instead of the entire table, thus significantly reducing the number of rehashed buckets and improving the resizing performance. Experimental results demonstrate that level hashing achieves $1.4\\times$$-$$3.0\\times$ speedup for insertions, $1.2\\times$$-$$2.1\\times$ speedup for updates, and over $4.3\\times$ speedup for resizing, while maintaining high search and deletion performance, compared with state-of-the-art hashing schemes.

[FlashShare: Punching Through Server Storage Stack from Kernel to Firmware for Ultra-Low Latency SSDs](/conference/osdi18/presentation/zhang)
---------------------------------------------------------------------------------------------------------------------------------------------

Jie Zhang, Miryeong Kwon, Donghyun Gouk, Sungjoon Koh, and Changlim Lee, _Yonsei University;_ Mohammad Alian, _UIUC;_ Myoungjun Chun, _Seoul National University;_ Mahmut Taylan Kandemir, _Penn State University;_ Nam Sung Kim, _UIUC;_ Jihong Kim, _Seoul National University;_ Myoungsoo Jung, _Yonsei University_

Available Media

[](/conference/osdi18/presentation/zhang)](/conference/osdi18/presentation/zhang)](/conference/osdi18/presentation/zhang)

A modern datacenter server aims to achieve high energy efficiency by co-running multiple applications. Some of such applications (e.g., web search) are latency sensitive. Therefore, they require low-latency I/O services to fast respond to requests from clients. However, we observe that simply replacing the storage devices of servers with Ultra-Low-Latency (ULL) SSDs does not notably reduce the latency of I/O services, especially when co-running multiple applications. In this paper, we propose FlashShare to assist ULL SSDs to satisfy different levels of I/O service latency requirements for different co-running applications. Specifically, FlashShare is a holistic cross-stack approach, which can significantly reduce I/O interferences among co-running applications at a server without any change in applications. At the kernel-level, we extend the data structures of the storage stack to pass attributes of (co-running) applications through all the layers of the underlying storage stack spanning from the OS kernel to the SSD firmware. For given attributes, the block layer and NVMe driver of FlashShare differently manage the I/O scheduler and interrupt handler of NVMe. We also enhance the NVMe controller and cache layer at the SSD firmware-level, by dynamically partitioning DRAM in the ULL SSD and adjusting its caching strategies to meet diverse user requirements. The evaluation results demonstrate that FlashShare can shorten the average and 99th-percentile turnaround response times of co-running applications by 22% and 31%, respectively.

### 3:20 pm–3:50 pm

Break with Refreshments
-----------------------

_Sponsored by ByteDance_

Costa Del Sol Patios

### 3:50 pm–5:10 pm

Debugging
---------

Session Chair: Rebecca Isaacs, _Twitter_

[Orca: Differential Bug Localization in Large-Scale Services](/conference/osdi18/presentation/bhagwan)
------------------------------------------------------------------------------------------------------

Ranjita Bhagwan, Rahul Kumar, Chandra Sekhar Maddila, and Adithya Abraham Philip, _Microsoft Research India_  
**_Awarded Best Paper!_**

Available Media

[](/conference/osdi18/presentation/bhagwan)](/conference/osdi18/presentation/bhagwan)](/conference/osdi18/presentation/bhagwan)

Today, we depend on numerous large-scale services for basic operations such as email. These services are complex and extremely dynamic as developers continously commit code and introduce new features, fixes and, consequently, new bugs. Hundreds of commits may enter deployment simultaneously. Therefore one of the most time-critical, yet complex tasks towards mitigating service disruption is to localize the bug to the right commit.

This paper presents the concept of differential bug localization that uses a combination of differential code analysis and software provenance tracking to effectively pin-point buggy commits. We have built Orca, a customized code search-engine that implements differential bug localization. Orca is actively being used by the On-Call Engineers (OCEs) of a large enterprise email and collaboration service to localize bugs to the appropriate buggy commits. Our evaluation shows that Orca correctly localizes 77% of bugs for which it has been used. We also show that it causes a 4x reduction in the work done by the OCE.

[Differential Energy Profiling: Energy Optimization via Diffing Similar Apps](/conference/osdi18/presentation/jindal)
---------------------------------------------------------------------------------------------------------------------

Abhilash Jindal and Y. Charlie Hu, _Purdue University_

Available Media

[](/conference/osdi18/presentation/jindal)](/conference/osdi18/presentation/jindal)](/conference/osdi18/presentation/jindal)

Mobile app energy profilers provide a foundational energy diagnostic tool by identifying energy hotspots in the app source code. However, they only tackle the first challenge faced by developers, as, after presented with the energy hotspots, developers typically do not have any guidance on how to proceed with the remaining optimization process: (1) Is there a more energy-efficient implementation for the same app task? (2) How to come up with the more efficient implementation?

To help developers tackle these challenges, we developed a new energy profiling methodology called _differ- ential energy profiling_ that automatically uncovers more efficient implementations of common app tasks by leveraging existing implementations of similar apps which are bountiful in the app marketplace. To demonstrate its effectiveness, we implemented such a differential energy profiler, DIFFPROF, for Android apps and used it to profile 8 groups (from 6 popular app categories) of 5 similar apps each. Our extensive case studies show that DIFFPROF provides developers with actionable diagnosis beyond a traditional energy profiler: it identifies non-essential (unmatched or extra) and known-to-be inefficient (matched) tasks, and the call trees of tasks it extracts further allow developers to quickly understand the reasons and develop fixes for the energy difference with minor manual debugging efforts.

[wPerf: Generic Off-CPU Analysis to Identify Bottleneck Waiting Events](/conference/osdi18/presentation/zhou)
-------------------------------------------------------------------------------------------------------------

Fang Zhou, Yifan Gan, Sixiang Ma, and Yang Wang, _The Ohio State University_

Available Media

[](/conference/osdi18/presentation/zhou)](/conference/osdi18/presentation/zhou)](/conference/osdi18/presentation/zhou)

This paper tries to identify waiting events that limit the maximal throughput of a multi-threaded application. To achieve this goal, we not only need to understand an event's impact on threads waiting for this event (i.e., local impact), but also need to understand whether its impact can reach other threads that are involved in request processing (i.e., global impact).

To address these challenges, wPerf computes the local impact of a waiting event with a technique called cascaded re-distribution; more importantly, wPerf builds a wait-for graph to compute whether such impact can indirectly reach other threads. By combining these two techniques, wPerf essentially tries to identify events with large impacts on all threads.

We apply wPerf to a number of open-source multi-threaded applications. By following the guide of wPerf, we are able to improve their throughput by up to 4.83$\\times$. The overhead of recording waiting events at runtime is about 5.1% on average.

[Sledgehammer: Cluster-Fueled Debugging](/conference/osdi18/presentation/quinn)
-------------------------------------------------------------------------------

Andrew Quinn, Jason Flinn, and Michael Cafarella, _University of Michigan_

Available Media

[](/conference/osdi18/presentation/quinn)](/conference/osdi18/presentation/quinn)](/conference/osdi18/presentation/quinn)

Current debugging tools force developers to choose between power and interactivity. Interactive debuggers such as gdb let them quickly inspect application state and monitor execution, which is perfect for simple bugs. However, they are not powerful enough for complex bugs such as wild stores and synchronization errors where developers do not know which values to inspect or when to monitor the execution. So, developers add logging, insert timing measurements, and create functions that verify invariants. Then, they re-run applications with this instrumentation. These powerful tools are, unfortunately, not interactive; they can take minutes or hours to answer one question about a complex execution, and debugging involves asking and answering many such questions.

In this paper, we propose cluster-fueled debugging, which provides interactivity for powerful debugging tools by parallelizing their work across many cores in a cluster. At sufficient scale, developers can get answers to even detailed queries in a few seconds. Sledgehammer is a cluster-fueled debugger: it improves performance by timeslicing program execution, debug instrumentation, and analysis of results, and then executing each chunk of work on a separate core. Sledgehammer enables powerful, interactive debugging tools that are infeasible today. Parallel retro-logging allows developers to change their logging instrumentation and then quickly see what the new logging would have produced on a previous execution. Continuous function evaluation logically evaluates a function such as a data-structure integrity check at every point in a program’s execution. Retro-timing allows fast performance analysis of a previous execution. With 1024 cores, Sledgehammer executes these tools hundreds of times faster than single-core execution while returning identical results.

### 6:00 pm–7:30 pm

Poster Session and Reception II
-------------------------------

Costa Del Sol Foyer and Salon A–C

Check out the cool new ideas and the latest preliminary research on display at the Poster Sessions and Receptions. Take part in discussions with your colleagues over complimentary food and drinks. View the [list of accepted posters](/conference/osdi18/poster-sessions#poster2).

### 7:30 pm–8:30 pm

Preview Session 3
-----------------

Are you new to OSDI? Are you a networks expert but feel bewildered when talk turns to security? Are you interested in engaging more deeply with paper presentations outside your research area? Join us for the OSDI preview sessions, where area experts will give short introductions to the symposium's major technical sessions.

*   **ML:** Shivaram Venkataraman, _University of Wisconsin—Madison_
*   **Networking:** Simon Peter, _The University of Texas at Austin_
*   **Security:** David Lazar, _Massachusetts Institute of Technology_

Available Media

](/conference/osdi18/presentation/preview3)](/conference/osdi18/presentation/preview3)

Wednesday, October 10, 2018
---------------------------

### 8:00 am–9:00 am

Continental Breakfast
---------------------

Costa Del Sol Patios

### 9:00 am–10:20 am

Machine Learning
----------------

Session Chair: Rashmi Vinayak, _Carnegie Mellon University_

[Ray: A Distributed Framework for Emerging AI Applications](/conference/osdi18/presentation/moritz)
---------------------------------------------------------------------------------------------------

Philipp Moritz, Robert Nishihara, Stephanie Wang, Alexey Tumanov, Richard Liaw, Eric Liang, Melih Elibol, Zongheng Yang, William Paul, Michael I. Jordan, and Ion Stoica, _UC Berkeley_

Available Media

[](/conference/osdi18/presentation/moritz)](/conference/osdi18/presentation/moritz)

The next generation of AI applications will continuously interact with the environment and learn from these interactions. These applications impose new and demanding systems requirements, both in terms of performance and flexibility. In this paper, we consider these requirements and present Ray — a distributed system to address them. Ray implements a unified interface that can express both task-parallel and actor-based computations, supported by a single dynamic execution engine. To meet the performance requirements, Ray employs a distributed scheduler and a distributed and fault-tolerant store to manage the system’s control state. In our experiments, we demonstrate scaling beyond 1.8 million tasks per second and better performance than existing specialized systems for several challenging reinforcement learning applications.

[TVM: An Automated End-to-End Optimizing Compiler for Deep Learning](/conference/osdi18/presentation/chen)
----------------------------------------------------------------------------------------------------------

Tianqi Chen and Thierry Moreau, _University of Washington;_ Ziheng Jiang, _University of Washington, AWS;_ Lianmin Zheng, _Shanghai Jiao Tong University;_ Eddie Yan, Haichen Shen, and Meghan Cowan, _University of Washington;_ Leyuan Wang, _UC Davis, AWS;_ Yuwei Hu, _Cornell;_ Luis Ceze, Carlos Guestrin, and Arvind Krishnamurthy, _University of Washington_

Available Media

[](/conference/osdi18/presentation/chen)](/conference/osdi18/presentation/chen)](/conference/osdi18/presentation/chen)

There is an increasing need to bring machine learning to a wide diversity of hardware devices. Current frameworks rely on vendor-specific operator libraries and optimize for a narrow range of server-class GPUs. Deploying workloads to new platforms -- such as mobile phones, embedded devices, and accelerators (e.g., FPGAs, ASICs) -- requires significant manual effort. We propose TVM, a compiler that exposes graph-level and operator-level optimizations to provide performance portability to deep learning workloads across diverse hardware back-ends. TVM solves optimization challenges specific to deep learning, such as high-level operator fusion, mapping to arbitrary hardware primitives, and memory latency hiding. It also automates optimization of low-level programs to hardware characteristics by employing a novel, learning-based cost modeling method for rapid exploration of code optimizations. Experimental results show that TVM delivers performance across hardware back-ends that are competitive with state-of-the-art, hand-tuned libraries for low-power CPU, mobile GPU, and server-class GPUs. We also demonstrate TVM's ability to target new accelerator back-ends, such as the FPGA-based generic deep learning accelerator. The system is open sourced and in production use inside several major companies.

[Gandiva: Introspective Cluster Scheduling for Deep Learning](/conference/osdi18/presentation/xiao)
---------------------------------------------------------------------------------------------------

Wencong Xiao, _Beihang University & Microsoft Research;_ Romil Bhardwaj, Ramachandran Ramjee, Muthian Sivathanu, and Nipun Kwatra, _Microsoft Research;_ Zhenhua Han, _The University of Hong Kong & Microsoft Research;_ Pratyush Patel, _Microsoft Research;_ Xuan Peng, _Huazhong University of Science and Technology & Microsoft Research;_ Hanyu Zhao, _Peking University & Microsoft Research;_ Quanlu Zhang, Fan Yang, and Lidong Zhou, _Microsoft Research_

Available Media

[](/conference/osdi18/presentation/xiao)](/conference/osdi18/presentation/xiao)](/conference/osdi18/presentation/xiao)

We introduce Gandiva, a new cluster scheduling framework that utilizes domain-specific knowledge to improve latency and efficiency of training deep learning models in a GPU cluster. One key characteristic of deep learning is feedback-driven exploration, where a user often runs a set of jobs (or a multi-job) to achieve the best result for a specific mission and uses early feedback on accuracy to dynamically prioritize or kill a subset of jobs; simultaneous early feedback on the entire multi-job is critical. A second characteristic is the heterogeneity of deep learning jobs in terms of resource usage, making it hard to achieve best-fit a priori. Gandiva addresses these two challenges by exploiting a third key characteristic of deep learning: intra-job predictability, as they perform numerous repetitive iterations called mini-batch iterations. Gandiva exploits intra-job predictability to time-slice GPUs efficiently across multiple jobs, thereby delivering low-latency. This predictability is also used for introspecting job performance and dynamically migrating jobs to better-fit GPUs, thereby improving cluster efficiency. We show via a prototype implementation and micro-benchmarks that Gandiva can speed up hyper-parameter searches during deep learning by up to an order of magnitude, and achieves better utilization by transparently migrating and time-slicing jobs to achieve better job-to-resource fit. We also show that, in a real workload of jobs running in a 180-GPU cluster, Gandiva improves aggregate cluster utilization by 26%, pointing to a new way of managing large GPU clusters for deep learning.

[PRETZEL: Opening the Black Box of Machine Learning Prediction Serving Systems](/conference/osdi18/presentation/lee)
--------------------------------------------------------------------------------------------------------------------

Yunseong Lee, _Seoul National University;_ Alberto Scolari, _Politecnico di Milano;_ Byung-Gon Chun, _Seoul National University;_ Marco Domenico Santambrogio, _Politecnico di Milano;_ Markus Weimer and Matteo Interlandi, _Microsoft_

Available Media

[](/conference/osdi18/presentation/lee)](/conference/osdi18/presentation/lee)](/conference/osdi18/presentation/lee)

Machine Learning models are often composed of pipelines of transformations. While this design allows to efficiently execute single model components at training time, prediction serving has different requirements such as low latency, high throughput and graceful performance degradation under heavy load. Current prediction serving systems consider models as black boxes, whereby prediction-time-specific optimizations are ignored in favor of ease of deployment. In this paper, we present PRETZEL, a prediction serving system introducing a novel white box architecture enabling both end-to-end and multi-model optimizations. Using production-like model pipelines, our experiments show that PRETZEL is able to introduce performance improvements over different dimensions; compared to state-of-the-art approaches PRETZEL is on average able to reduce 99th percentile latency by 5.5× while reducing memory footprint by 25×, and increasing throughput by 4.7×.

### 10:20 am–10:50 am

Break with Refreshments
-----------------------

Costa Del Sol Patios

### 10:50 am–11:50 am

Networking
----------

Session Chair: Rachit Agarwal, _Cornell University_

[Splinter: Bare-Metal Extensions for Multi-Tenant Low-Latency Storage](/conference/osdi18/presentation/kulkarni)
----------------------------------------------------------------------------------------------------------------

Chinmay Kulkarni, Sara Moore, Mazhar Naqvi, Tian Zhang, Robert Ricci, and Ryan Stutsman, _University of Utah_

Available Media

[](/conference/osdi18/presentation/kulkarni)](/conference/osdi18/presentation/kulkarni)](/conference/osdi18/presentation/kulkarni)

In-memory key-value stores that use kernel-bypass networking serve millions of operations per second per machine with microseconds of latency. They are fast in part because they are simple, but their simple interfaces force applications to move data across the network. This is inefficient for operations that aggregate over large amounts of data, and it causes delays when traversing complex data structures. Ideally, applications could push small functions to storage to avoid round trips and data movement; however, pushing code to these fast systems is challenging. Any extra complexity for interpreting or isolating code cuts into their latency and throughput benefits.

We present Splinter, a low-latency key-value store that clients extend by pushing code to it. Splinter is designed for modern multi-tenant data centers; it allows mutually distrusting tenants to write their own fine-grained extensions and push them to the store at runtime. The core of Splinter’s design relies on type- and memory-safe extension code to avoid conventional hardware isolation costs. This still allows for bare-metal execution, avoids data copying across trust boundaries, and makes granular storage functions that perform less than a microsecond of compute practical. Our measurements show that Splinter can process 3.5 million remote extension invocations per second with a median round-trip latency of less than 9 μs at densities of more than 1,000 tenants per server. We provide an implementation of Facebook’s TAO as an 800 line extension that, when pushed to a Splinter server, improves performance by 400 Kop/s to perform 3.2 Mop/s over online graph data with 30 μs remote access times.

[Neural Adaptive Content-aware Internet Video Delivery](/conference/osdi18/presentation/yeo)
--------------------------------------------------------------------------------------------

Hyunho Yeo, Youngmok Jung, Jaehong Kim, Jinwoo Shin, and Dongsu Han, _KAIST_

Available Media

[](/conference/osdi18/presentation/yeo)](/conference/osdi18/presentation/yeo)](/conference/osdi18/presentation/yeo)

Internet video streaming has experienced tremendous growth over the last few decades. However, the quality of existing video delivery critically depends on the bandwidth resource. Consequently, user quality of experience (QoE) suffers inevitably when network conditions become unfavorable. We present a new video delivery framework that utilizes client computation and recent advances in deep neural networks (DNNs) to reduce the dependency for delivering high-quality video. The use of DNNs enables us to enhance the video quality independent to the available bandwidth. We design a practical system that addresses several challenges, such as client heterogeneity, interaction with bitrate adaptation, and DNN transfer, in enabling the idea. Our evaluation using 3G and broadband network traces shows the proposed system outperforms the current state of the art, enhancing the average QoE by 43.08% using the same bandwidth budget or saving 17.13% of bandwidth while providing the same user QoE.

[Floem: A Programming System for NIC-Accelerated Network Applications](/conference/osdi18/presentation/phothilimthana)
----------------------------------------------------------------------------------------------------------------------

Phitchaya Mangpo Phothilimthana, _University of California, Berkeley;_ Ming Liu and Antoine Kaufmann, _University of Washington;_ Simon Peter, _The University of Texas at Austin;_ Rastislav Bodik and Thomas Anderson, _University of Washington_

Available Media

[](/conference/osdi18/presentation/phothilimthana)](/conference/osdi18/presentation/phothilimthana)](/conference/osdi18/presentation/phothilimthana)

Developing server applications that offload computation and data to a NIC accelerator is laborious because one has to explore the design space of decisions about data placement and caching; partitioning of code and its parallelism; and communication strategies between program components across devices.

We propose programming abstractions for NIC-accelerated applications, balancing the ease of developing a correct application and the ability to refactor it to explore different design choices. The design space includes semantic changes as well as variations on parallelization and program-to-resource mapping. Our abstractions include logical and physical queues and a construct for mapping the former onto the latter; global per-packet state; a remote caching construct; and an interface to external application code. We develop Floem, a programming system that provides these abstractions, and show that the system helps explore a space of NIC-offloading designs for real-world applications, including a key-value store and a distributed real-time data analytics system, improving throughput by 1.3--3.6x.

### 11:50 am–2:00 pm

Lunch (on your own)
-------------------

### 2:00 pm–3:20 pm

Security
--------

Session Chair: Jay Lorch, _Microsoft Research_

[Graviton: Trusted Execution Environments on GPUs](/conference/osdi18/presentation/volos)
-----------------------------------------------------------------------------------------

Stavros Volos and Kapil Vaswani, _Microsoft Research;_ Rodrigo Bruno, _INESC-ID / IST, University of Lisbon_

Available Media

[](/conference/osdi18/presentation/volos)](/conference/osdi18/presentation/volos)](/conference/osdi18/presentation/volos)

We propose Graviton, an architecture for supporting trusted execution environments on GPUs. Graviton enables applications to offload security- and performance-sensitive kernels and data to a GPU, and execute kernels in isolation from other code running on the GPU and all software on the host, including the device driver, the operating system, and the hypervisor. Graviton can be integrated into existing GPUs with relatively low hardware complexity; all changes are restricted to peripheral components, such as the GPU’s command processor, with no changes to existing CPUs, GPU cores, or the GPU’s MMU and memory controller. We also propose extensions to the CUDA runtime for securely copying data and executing kernels on the GPU. We have implemented Graviton on off-the-shelf NVIDIA GPUs, using emulation for new hardware features. Our evaluation shows that overheads are low(17-33%)with encryption and decryption of traffic to and from the GPU being the main source of overheads.

[ZebRAM: Comprehensive and Compatible Software Protection Against Rowhammer Attacks](/conference/osdi18/presentation/konoth)
----------------------------------------------------------------------------------------------------------------------------

Radhesh Krishnan Konoth, _Vrije Universiteit Amsterdam;_ Marco Oliverio, _University of Calabria/Vrije Universiteit Amsterdam;_ Andrei Tatar, Dennis Andriesse, Herbert Bos, Cristiano Giuffrida, and Kaveh Razavi, _Vrije Universiteit Amsterdam_

Available Media

[](/conference/osdi18/presentation/konoth)](/conference/osdi18/presentation/konoth)](/conference/osdi18/presentation/konoth)

The Rowhammer vulnerability common to many modern DRAM chips allows attackers to trigger bit flips in a row of memory cells by accessing the adjacent rows at high frequencies. As a result, they are able to corrupt sensitive data structures (such as page tables, cryptographic keys, object pointers, or even instructions in a program), and circumvent all existing defenses. This paper introduces ZebRAM, a novel and comprehensive software-level protection against Rowhammer. ZebRAM isolates every DRAM row that contains data with guard rows that absorb any Rowhammer-induced bit flips; the only known method to protect against all forms of Rowhammer. Rather than leaving guard rows unused, ZebRAM improves performance by using the guard rows as efficient, integrity-checked and optionally compressed swap space. ZebRAM requires no hardware modifications and builds on virtualization extensions in commodity processors to transparently control data placement in DRAM. Our evaluation shows that ZebRAM provides strong security guarantees while utilizing all available memory.

[Karaoke: Distributed Private Messaging Immune to Passive Traffic Analysis](/conference/osdi18/presentation/lazar)
------------------------------------------------------------------------------------------------------------------

David Lazar, Yossi Gilad, and Nickolai Zeldovich, _MIT CSAIL_

Available Media

[](/conference/osdi18/presentation/lazar)](/conference/osdi18/presentation/lazar)](/conference/osdi18/presentation/lazar)

Karaoke is a system for low-latency metadata-private communication. Karaoke provides differential privacy guarantees, and scales better with the number of users than prior such systems (Vuvuzela and Stadium). Karaoke achieves high performance by addressing two challenges faced by prior systems. The first is that differential privacy requires continuously adding noise messages, which leads to high overheads. Karaoke avoids this using optimistic indistinguishability: in the common case, Karaoke reveals no information to the adversary, and Karaoke clients can detect precisely when information may be revealed (thus requiring less noise). The second challenge lies in generating sufficient noise in a distributed system where some nodes may be malicious. Prior work either required each server to generate enough noise on its own, or used expensive verifiable shuffles to prevent any message loss. Karaoke achieves high performance using efficient noise verification, generating noise across many servers and using Bloom filters to efficiently check if any noise messages have been discarded. These techniques allow our prototype of Karaoke to achieve a latency of 6.8 seconds for 2M users. Overall, Karaoke's latency is 5x to 10x better than Vuvuzela and Stadium.

[Obladi: Oblivious Serializable Transactions in the Cloud](/conference/osdi18/presentation/crooks)
--------------------------------------------------------------------------------------------------

Natacha Crooks, _The University of Texas at Austin;_ Matthew Burke, Ethan Cecchetti, Sitar Harel, Rachit Agarwal, and Lorenzo Alvisi, _Cornell University_

Available Media

[](/conference/osdi18/presentation/crooks)](/conference/osdi18/presentation/crooks)](/conference/osdi18/presentation/crooks)

This paper presents the design and implementation of Obladi, the first system to provide ACID transactions while also hiding access patterns. Obladi uses as its building block oblivious RAM, but turns the demands of supporting transactions into a performance opportunity. By executing transactions within epochs and delaying commit decisions until an epoch ends, Obladi reduces the amortized bandwidth costs of oblivious storage and increases overall system throughput. These performance gains, combined with new oblivious mechanisms for concurrency control and recovery, allow Obladi to execute OLTP workloads with reasonable throughput : it comes within 5×to 12× of a non-oblivious baseline on the TPC-C, SmallBank, and FreeHealth applications. Latency overheads, however, are higher (70× on TPC-C).

### 3:20 pm–3:50 pm

Break with Refreshments
-----------------------

Costa Del Sol Patios

### 3:50 pm–5:10 pm

Graphs and Data
---------------

Session Chair: Marcos K. Aguilera, _VMware Research_

[ASAP: Fast, Approximate Graph Pattern Mining at Scale](/conference/osdi18/presentation/iyer)
---------------------------------------------------------------------------------------------

Anand Padmanabha Iyer, _UC Berkeley;_ Zaoxing Liu and Xin Jin, _Johns Hopkins University;_ Shivaram Venkataraman, _Microsoft Research / University of Wisconsin;_ Vladimir Braverman, _Johns Hopkins University;_ Ion Stoica, _UC Berkeley_

Available Media

[](/conference/osdi18/presentation/iyer)](/conference/osdi18/presentation/iyer)](/conference/osdi18/presentation/iyer)

While there has been a tremendous interest in processing data that has an underlying graph structure, existing distributed graph processing systems take several minutes or even hours to mine simple patterns on graphs. This paper presents ASAP, a fast, approximate computation engine for graph pattern mining. ASAP leverages state-of-the-art results in graph approximation theory, and extends it to general graph patterns in distributed settings. To enable the users to navigate the trade-off between the result accuracy and latency, we propose a novel approach to build the Error-Latency Profile (ELP) for a given computation. We have implemented ASAP on a general-purpose distributed dataflow platform, and evaluated it extensively on several graph patterns. Our experimental results show that ASAP outperforms existing exact pattern mining solutions by up to 77×. Further, ASAP can scale to graphs with billions of edges without the need for large clusters.

[RStream: Marrying Relational Algebra with Streaming for Efficient Graph Mining on A Single Machine](/conference/osdi18/presentation/wang)
------------------------------------------------------------------------------------------------------------------------------------------

Kai Wang, _UCLA;_ Zhiqiang Zuo, _Nanjing University;_ John Thorpe, _UCLA;_ Tien Quang Nguyen, _Facebook;_ Guoqing Harry Xu, _UCLA_

Available Media

[](/conference/osdi18/presentation/wang)](/conference/osdi18/presentation/wang)](/conference/osdi18/presentation/wang)

Graph mining is an important category of graph algorithms that aim to discover structural patterns such as cliques and motifs in a graph. While a great deal of work has been done recently on graph computation such as PageRank, systems support for scalable graph mining is still limited. Existing mining systems such as Arabesque focus on distributed computing and need large amounts of compute and memory resources.

We built RStream, the first single-machine, out-of-core mining system that leverages disk support to store intermediate data. At its core are two innovations: (1) a rich programming model that exposes relational algebra for developers to express a wide variety of mining tasks; and (2) a runtime engine that implements relational algebra efficiently with tuple streaming. A comparison between RStream and four state-of-the-art distributed mining/Datalog systems---Arabesque, ScaleMine, DistGraph, and BigDatalog---demonstrates that RStream outperforms all of them, running on a 10-node cluster, e.g., by at least a factor of 1.7, and can process large graphs on an inexpensive machine.

[Three steps is all you need: fast, accurate, automatic scaling decisions for distributed streaming dataflows](/conference/osdi18/presentation/kalavri)
-------------------------------------------------------------------------------------------------------------------------------------------------------

Vasiliki Kalavri, John Liagouris, Moritz Hoffmann, and Desislava Dimitrova, _ETH Zurich;_ Matthew Forshaw, _Newcastle University;_ Timothy Roscoe, _ETH Zurich_

Available Media

[](/conference/osdi18/presentation/kalavri)](/conference/osdi18/presentation/kalavri)](/conference/osdi18/presentation/kalavri)

Streaming computations are by nature long-running, and their workloads can change in unpredictable ways. This in turn means that maintaining performance may require dynamically scaling allocated computational resources. Some modern large-scale stream processors allow dynamic scaling but typically leave the difficult task of deciding how much to scale to the user. The process is cumbersome, slow and often inefficient. Where automatic scaling is supported, policies rely on coarse-grained metrics like observed throughput, backpressure, and CPU utilization. As a result, they tend to show incorrect provisioning, oscillations, and long convergence times. We present DS2, an automatic scaling controller for such systems which combines a general performance model of streaming dataflows with lightweight instrumentation to estimate the true processing and output rates of individual dataflow operators. We apply DS2 on Apache Flink and Timely Dataflow and demonstrate its accuracy and fast convergence. When compared to Dhalion, the state-of-the-art technique in Heron, DS2 converges to the optimal, backpressure-free configuration in a single step instead of six.

[Flare: Optimizing Apache Spark with Native Compilation for Scale-Up Architectures and Medium-Size Data](/conference/osdi18/presentation/essertel)
--------------------------------------------------------------------------------------------------------------------------------------------------

Gregory Essertel, Ruby Tahboub, and James Decker, _Purdue University;_ Kevin Brown and Kunle Olukotun, _Stanford University;_ Tiark Rompf, _Purdue University_

Available Media

/conference/osdi18/presentation/essertel)In recent years, Apache Spark has become the de facto standard for big data processing. Spark has enabled a wide audience of users to process petabyte-scale workloads due to its flexibility and ease of use: users are able to mix SQL-style relational queries with Scala or Python code, and have the resultant programs distributed across an entire cluster, all without having to work with low-level parallelization or network primitives.

However, many workloads of practical importance are not large enough to justify distributed, scale-out execution, as the data may reside entirely in main memory of a single powerful server. Still, users want to use Spark for its familiar interface and tooling. In such scale-up scenarios, Spark's performance is suboptimal, as Spark prioritizes handling data size over optimizing the computations on that data. For such medium-size workloads, performance may still be of critical importance if jobs are computationally heavy, need to be run frequently on changing data, or interface with external libraries and systems (e.g., TensorFlow for machine learning).

We present Flare, an accelerator module for Spark that delivers order of magnitude speedups on scale-up architectures for a large class of applications. Inspired by query compilation techniques from main-memory database systems, Flare incorporates a code generation strategy designed to match the unique aspects of Spark and the characteristics of scale-up architectures, in particular processing data directly from optimized file formats and combining SQL-style relational processing with external frameworks such as TensorFlow.
