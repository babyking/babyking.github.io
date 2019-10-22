---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: 代码的注释
date: 2019-10-17 09:51
category: 技术 
tags: [c,注释]
---



一个很好的c代码注释习惯

1. 返回类型独立一行
2. 函数级的左括号单独一行
3. 函数内的代码块的左括号在行尾

```c
/* Job died (waitpid() returned its pid). */  
void  //类型独立一行,便于阅读 
job_check_died(pid_t pid, int status)
{     //函数的左括号独立一行,下面的代码块全部都放在行尾.
	struct job	*job;

	LIST_FOREACH(job, &all_jobs, entry) {  //左括号放在行尾
		if (pid == job->pid)
			break;
	}
	if (job == NULL)
		return;
	log_debug("job died %p: %s, pid %ld", job, job->cmd, (long) job->pid);

	job->status = status;

	if (job->state == JOB_CLOSED) {
		if (job->completecb != NULL)
			job->completecb(job);
		job_free(job);
	} else {
		job->pid = -1;
		job->state = JOB_DEAD;
	}
}

```

