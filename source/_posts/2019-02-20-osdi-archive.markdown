---
layout: post
title: "OSDI archive"
date: 2019-02-20 21:19:25 +0800
comments: true
categories: papers
---

Although the program of each OSDI conference can be easily found in the network, an archive page can help us to soonly review the history published work on OSDI. :)



This page will be updated continuously~ (if not, you can notify me through email)

[TOC]



## OSDI 2018

### Understanding Failures

**<font color=#005493>Capturing and Enhancing In Situ System Observability for Failure Detection</font>**

Peng Huang, *Johns Hopkins University;* Chuanxiong Guo, *ByteDance Inc.;* Jacob R. Lorch and Lidong Zhou, *Microsoft Research;* Yingnong Dang, *Microsoft*

**Abstract** Real-world distributed systems suffer unavailability due to various types of failure. But, despite enormous effort, many failures, especially gray failures, still escape detection. In this paper, we argue that the missing piece in failure detection is detecting what the requesters of a failing component see. This insight leads us to the design and implementation of Panorama, a system designed to enhance \emph{system observability} by taking advantage of the interactions between a system's components. By providing a systematic channel and analysis tool, Panorama turns a component into a logical observer so that it not only handles errors, but also \emph{reports} them. Furthermore, Panorama incorporates techniques for making such observations even when indirection exists between components. Panorama can easily integrate with popular distributed systems and detect all 15 \emph{real-world} gray failures that we reproduced in less than 7 s, whereas existing approaches detect only one of them in under 300 s.



**<font color=#005493>REPT: Reverse Debugging of Failures in Deployed Software</font>**

Weidong Cui and Xinyang Ge, *Microsoft Research Redmond;* Baris Kasikci, *University of Michigan;* Ben Niu, *Microsoft Research Redmond;* Upamanyu Sharma, *University of Michigan;* Ruoyu Wang, *Arizona State University;* Insu Yun, *Georgia Institute of Technology*

***Awarded Best Paper!***

**Abstract** Debugging software failures in deployed systems is important because they impact real users and customers. However, debugging such failures is notoriously hard in practice because developers have to rely on limited information such as memory dumps. The execution history is usually unavailable because high-fidelity program tracing is not affordable in deployed systems.

In this paper, we present REPT, a practical system that enables reverse debugging of software failures in deployed systems. REPT reconstructs the execution history with high fidelity by combining online lightweight hardware tracing of a program's control flow with offline binary analysis that recovers its data flow. It is seemingly impossible to recover data values thousands of instructions before the failure due to information loss and concurrent execution. REPT tackles these challenges by constructing a partial execution order based on timestamps logged by hardware and iteratively performing forward and backward execution with error correction.

We design and implement REPT, deploy it on Microsoft Windows, and integrate it into Windows Debugger. We evaluate REPT on 16 real-world bugs and show that it can recover data values accurately (92% on average) and efficiently (less than 20 seconds) for these bugs. We also show that it enables effective reverse debugging for 14 bugs.



### Operating Systems