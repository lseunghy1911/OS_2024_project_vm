
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 04             	sub    $0x4,%esp
  if(fork() > 0)
  11:	e8 65 02 00 00       	call   27b <fork>
  16:	85 c0                	test   %eax,%eax
  18:	7e 0d                	jle    27 <main+0x27>
    sleep(5);  // Let child exit before parent.
  1a:	83 ec 0c             	sub    $0xc,%esp
  1d:	6a 05                	push   $0x5
  1f:	e8 ef 02 00 00       	call   313 <sleep>
  24:	83 c4 10             	add    $0x10,%esp
  exit();
  27:	e8 57 02 00 00       	call   283 <exit>
  2c:	66 90                	xchg   %ax,%ax
  2e:	66 90                	xchg   %ax,%ax

00000030 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  30:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  31:	31 c0                	xor    %eax,%eax
{
  33:	89 e5                	mov    %esp,%ebp
  35:	53                   	push   %ebx
  36:	8b 4d 08             	mov    0x8(%ebp),%ecx
  39:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  40:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  44:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  47:	83 c0 01             	add    $0x1,%eax
  4a:	84 d2                	test   %dl,%dl
  4c:	75 f2                	jne    40 <strcpy+0x10>
    ;
  return os;
}
  4e:	89 c8                	mov    %ecx,%eax
  50:	5b                   	pop    %ebx
  51:	5d                   	pop    %ebp
  52:	c3                   	ret    
  53:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000060 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  60:	55                   	push   %ebp
  61:	89 e5                	mov    %esp,%ebp
  63:	53                   	push   %ebx
  64:	8b 4d 08             	mov    0x8(%ebp),%ecx
  67:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  6a:	0f b6 01             	movzbl (%ecx),%eax
  6d:	0f b6 1a             	movzbl (%edx),%ebx
  70:	84 c0                	test   %al,%al
  72:	75 1d                	jne    91 <strcmp+0x31>
  74:	eb 2a                	jmp    a0 <strcmp+0x40>
  76:	8d 76 00             	lea    0x0(%esi),%esi
  79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  80:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
  84:	83 c1 01             	add    $0x1,%ecx
  87:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  8a:	0f b6 1a             	movzbl (%edx),%ebx
  8d:	84 c0                	test   %al,%al
  8f:	74 0f                	je     a0 <strcmp+0x40>
  91:	38 d8                	cmp    %bl,%al
  93:	74 eb                	je     80 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
  95:	29 d8                	sub    %ebx,%eax
}
  97:	5b                   	pop    %ebx
  98:	5d                   	pop    %ebp
  99:	c3                   	ret    
  9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  a0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
  a2:	29 d8                	sub    %ebx,%eax
}
  a4:	5b                   	pop    %ebx
  a5:	5d                   	pop    %ebp
  a6:	c3                   	ret    
  a7:	89 f6                	mov    %esi,%esi
  a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000000b0 <strlen>:

uint
strlen(const char *s)
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
  b6:	80 3a 00             	cmpb   $0x0,(%edx)
  b9:	74 15                	je     d0 <strlen+0x20>
  bb:	31 c0                	xor    %eax,%eax
  bd:	8d 76 00             	lea    0x0(%esi),%esi
  c0:	83 c0 01             	add    $0x1,%eax
  c3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  c7:	89 c1                	mov    %eax,%ecx
  c9:	75 f5                	jne    c0 <strlen+0x10>
    ;
  return n;
}
  cb:	89 c8                	mov    %ecx,%eax
  cd:	5d                   	pop    %ebp
  ce:	c3                   	ret    
  cf:	90                   	nop
  for(n = 0; s[n]; n++)
  d0:	31 c9                	xor    %ecx,%ecx
}
  d2:	5d                   	pop    %ebp
  d3:	89 c8                	mov    %ecx,%eax
  d5:	c3                   	ret    
  d6:	8d 76 00             	lea    0x0(%esi),%esi
  d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000000e0 <memset>:

void*
memset(void *dst, int c, uint n)
{
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  e3:	57                   	push   %edi
  e4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
  ea:	8b 45 0c             	mov    0xc(%ebp),%eax
  ed:	89 d7                	mov    %edx,%edi
  ef:	fc                   	cld    
  f0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  f2:	89 d0                	mov    %edx,%eax
  f4:	5f                   	pop    %edi
  f5:	5d                   	pop    %ebp
  f6:	c3                   	ret    
  f7:	89 f6                	mov    %esi,%esi
  f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000100 <strchr>:

char*
strchr(const char *s, char c)
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	8b 45 08             	mov    0x8(%ebp),%eax
 106:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 10a:	0f b6 10             	movzbl (%eax),%edx
 10d:	84 d2                	test   %dl,%dl
 10f:	75 12                	jne    123 <strchr+0x23>
 111:	eb 1d                	jmp    130 <strchr+0x30>
 113:	90                   	nop
 114:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 118:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 11c:	83 c0 01             	add    $0x1,%eax
 11f:	84 d2                	test   %dl,%dl
 121:	74 0d                	je     130 <strchr+0x30>
    if(*s == c)
 123:	38 d1                	cmp    %dl,%cl
 125:	75 f1                	jne    118 <strchr+0x18>
      return (char*)s;
  return 0;
}
 127:	5d                   	pop    %ebp
 128:	c3                   	ret    
 129:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 130:	31 c0                	xor    %eax,%eax
}
 132:	5d                   	pop    %ebp
 133:	c3                   	ret    
 134:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 13a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000140 <gets>:

char*
gets(char *buf, int max)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	57                   	push   %edi
 144:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 145:	31 f6                	xor    %esi,%esi
{
 147:	53                   	push   %ebx
 148:	89 f3                	mov    %esi,%ebx
 14a:	83 ec 1c             	sub    $0x1c,%esp
 14d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 150:	eb 2f                	jmp    181 <gets+0x41>
 152:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 158:	83 ec 04             	sub    $0x4,%esp
 15b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 15e:	6a 01                	push   $0x1
 160:	50                   	push   %eax
 161:	6a 00                	push   $0x0
 163:	e8 33 01 00 00       	call   29b <read>
    if(cc < 1)
 168:	83 c4 10             	add    $0x10,%esp
 16b:	85 c0                	test   %eax,%eax
 16d:	7e 1c                	jle    18b <gets+0x4b>
      break;
    buf[i++] = c;
 16f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 173:	83 c7 01             	add    $0x1,%edi
 176:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 179:	3c 0a                	cmp    $0xa,%al
 17b:	74 23                	je     1a0 <gets+0x60>
 17d:	3c 0d                	cmp    $0xd,%al
 17f:	74 1f                	je     1a0 <gets+0x60>
  for(i=0; i+1 < max; ){
 181:	83 c3 01             	add    $0x1,%ebx
 184:	89 fe                	mov    %edi,%esi
 186:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 189:	7c cd                	jl     158 <gets+0x18>
 18b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 18d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 190:	c6 03 00             	movb   $0x0,(%ebx)
}
 193:	8d 65 f4             	lea    -0xc(%ebp),%esp
 196:	5b                   	pop    %ebx
 197:	5e                   	pop    %esi
 198:	5f                   	pop    %edi
 199:	5d                   	pop    %ebp
 19a:	c3                   	ret    
 19b:	90                   	nop
 19c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1a0:	8b 75 08             	mov    0x8(%ebp),%esi
 1a3:	8b 45 08             	mov    0x8(%ebp),%eax
 1a6:	01 de                	add    %ebx,%esi
 1a8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 1aa:	c6 03 00             	movb   $0x0,(%ebx)
}
 1ad:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1b0:	5b                   	pop    %ebx
 1b1:	5e                   	pop    %esi
 1b2:	5f                   	pop    %edi
 1b3:	5d                   	pop    %ebp
 1b4:	c3                   	ret    
 1b5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001c0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	56                   	push   %esi
 1c4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1c5:	83 ec 08             	sub    $0x8,%esp
 1c8:	6a 00                	push   $0x0
 1ca:	ff 75 08             	pushl  0x8(%ebp)
 1cd:	e8 f1 00 00 00       	call   2c3 <open>
  if(fd < 0)
 1d2:	83 c4 10             	add    $0x10,%esp
 1d5:	85 c0                	test   %eax,%eax
 1d7:	78 27                	js     200 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 1d9:	83 ec 08             	sub    $0x8,%esp
 1dc:	ff 75 0c             	pushl  0xc(%ebp)
 1df:	89 c3                	mov    %eax,%ebx
 1e1:	50                   	push   %eax
 1e2:	e8 f4 00 00 00       	call   2db <fstat>
  close(fd);
 1e7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 1ea:	89 c6                	mov    %eax,%esi
  close(fd);
 1ec:	e8 ba 00 00 00       	call   2ab <close>
  return r;
 1f1:	83 c4 10             	add    $0x10,%esp
}
 1f4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1f7:	89 f0                	mov    %esi,%eax
 1f9:	5b                   	pop    %ebx
 1fa:	5e                   	pop    %esi
 1fb:	5d                   	pop    %ebp
 1fc:	c3                   	ret    
 1fd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 200:	be ff ff ff ff       	mov    $0xffffffff,%esi
 205:	eb ed                	jmp    1f4 <stat+0x34>
 207:	89 f6                	mov    %esi,%esi
 209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000210 <atoi>:

int
atoi(const char *s)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	53                   	push   %ebx
 214:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 217:	0f be 02             	movsbl (%edx),%eax
 21a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 21d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 220:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 225:	77 1e                	ja     245 <atoi+0x35>
 227:	89 f6                	mov    %esi,%esi
 229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 230:	83 c2 01             	add    $0x1,%edx
 233:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 236:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 23a:	0f be 02             	movsbl (%edx),%eax
 23d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 240:	80 fb 09             	cmp    $0x9,%bl
 243:	76 eb                	jbe    230 <atoi+0x20>
  return n;
}
 245:	89 c8                	mov    %ecx,%eax
 247:	5b                   	pop    %ebx
 248:	5d                   	pop    %ebp
 249:	c3                   	ret    
 24a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000250 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	57                   	push   %edi
 254:	8b 45 10             	mov    0x10(%ebp),%eax
 257:	8b 55 08             	mov    0x8(%ebp),%edx
 25a:	56                   	push   %esi
 25b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 25e:	85 c0                	test   %eax,%eax
 260:	7e 13                	jle    275 <memmove+0x25>
 262:	01 d0                	add    %edx,%eax
  dst = vdst;
 264:	89 d7                	mov    %edx,%edi
 266:	8d 76 00             	lea    0x0(%esi),%esi
 269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    *dst++ = *src++;
 270:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 271:	39 f8                	cmp    %edi,%eax
 273:	75 fb                	jne    270 <memmove+0x20>
  return vdst;
}
 275:	5e                   	pop    %esi
 276:	89 d0                	mov    %edx,%eax
 278:	5f                   	pop    %edi
 279:	5d                   	pop    %ebp
 27a:	c3                   	ret    

0000027b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 27b:	b8 01 00 00 00       	mov    $0x1,%eax
 280:	cd 40                	int    $0x40
 282:	c3                   	ret    

00000283 <exit>:
SYSCALL(exit)
 283:	b8 02 00 00 00       	mov    $0x2,%eax
 288:	cd 40                	int    $0x40
 28a:	c3                   	ret    

0000028b <wait>:
SYSCALL(wait)
 28b:	b8 03 00 00 00       	mov    $0x3,%eax
 290:	cd 40                	int    $0x40
 292:	c3                   	ret    

00000293 <pipe>:
SYSCALL(pipe)
 293:	b8 04 00 00 00       	mov    $0x4,%eax
 298:	cd 40                	int    $0x40
 29a:	c3                   	ret    

0000029b <read>:
SYSCALL(read)
 29b:	b8 05 00 00 00       	mov    $0x5,%eax
 2a0:	cd 40                	int    $0x40
 2a2:	c3                   	ret    

000002a3 <write>:
SYSCALL(write)
 2a3:	b8 10 00 00 00       	mov    $0x10,%eax
 2a8:	cd 40                	int    $0x40
 2aa:	c3                   	ret    

000002ab <close>:
SYSCALL(close)
 2ab:	b8 15 00 00 00       	mov    $0x15,%eax
 2b0:	cd 40                	int    $0x40
 2b2:	c3                   	ret    

000002b3 <kill>:
SYSCALL(kill)
 2b3:	b8 06 00 00 00       	mov    $0x6,%eax
 2b8:	cd 40                	int    $0x40
 2ba:	c3                   	ret    

000002bb <exec>:
SYSCALL(exec)
 2bb:	b8 07 00 00 00       	mov    $0x7,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret    

000002c3 <open>:
SYSCALL(open)
 2c3:	b8 0f 00 00 00       	mov    $0xf,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret    

000002cb <mknod>:
SYSCALL(mknod)
 2cb:	b8 11 00 00 00       	mov    $0x11,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <unlink>:
SYSCALL(unlink)
 2d3:	b8 12 00 00 00       	mov    $0x12,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <fstat>:
SYSCALL(fstat)
 2db:	b8 08 00 00 00       	mov    $0x8,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <link>:
SYSCALL(link)
 2e3:	b8 13 00 00 00       	mov    $0x13,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <mkdir>:
SYSCALL(mkdir)
 2eb:	b8 14 00 00 00       	mov    $0x14,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <chdir>:
SYSCALL(chdir)
 2f3:	b8 09 00 00 00       	mov    $0x9,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <dup>:
SYSCALL(dup)
 2fb:	b8 0a 00 00 00       	mov    $0xa,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <getpid>:
SYSCALL(getpid)
 303:	b8 0b 00 00 00       	mov    $0xb,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <sbrk>:
SYSCALL(sbrk)
 30b:	b8 0c 00 00 00       	mov    $0xc,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <sleep>:
SYSCALL(sleep)
 313:	b8 0d 00 00 00       	mov    $0xd,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <uptime>:
SYSCALL(uptime)
 31b:	b8 0e 00 00 00       	mov    $0xe,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <walkpt>:
SYSCALL(walkpt)
 323:	b8 16 00 00 00       	mov    $0x16,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    
 32b:	66 90                	xchg   %ax,%ax
 32d:	66 90                	xchg   %ax,%ax
 32f:	90                   	nop

00000330 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	57                   	push   %edi
 334:	56                   	push   %esi
 335:	53                   	push   %ebx
 336:	83 ec 3c             	sub    $0x3c,%esp
 339:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 33c:	89 d1                	mov    %edx,%ecx
{
 33e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 341:	85 d2                	test   %edx,%edx
 343:	0f 89 7f 00 00 00    	jns    3c8 <printint+0x98>
 349:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 34d:	74 79                	je     3c8 <printint+0x98>
    neg = 1;
 34f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 356:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 358:	31 db                	xor    %ebx,%ebx
 35a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 35d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 360:	89 c8                	mov    %ecx,%eax
 362:	31 d2                	xor    %edx,%edx
 364:	89 cf                	mov    %ecx,%edi
 366:	f7 75 c4             	divl   -0x3c(%ebp)
 369:	0f b6 92 ac 08 00 00 	movzbl 0x8ac(%edx),%edx
 370:	89 45 c0             	mov    %eax,-0x40(%ebp)
 373:	89 d8                	mov    %ebx,%eax
 375:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 378:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 37b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 37e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 381:	76 dd                	jbe    360 <printint+0x30>
  if(neg)
 383:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 386:	85 c9                	test   %ecx,%ecx
 388:	74 0c                	je     396 <printint+0x66>
    buf[i++] = '-';
 38a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 38f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 391:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 396:	8b 7d b8             	mov    -0x48(%ebp),%edi
 399:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 39d:	eb 07                	jmp    3a6 <printint+0x76>
 39f:	90                   	nop
 3a0:	0f b6 13             	movzbl (%ebx),%edx
 3a3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 3a6:	83 ec 04             	sub    $0x4,%esp
 3a9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 3ac:	6a 01                	push   $0x1
 3ae:	56                   	push   %esi
 3af:	57                   	push   %edi
 3b0:	e8 ee fe ff ff       	call   2a3 <write>
  while(--i >= 0)
 3b5:	83 c4 10             	add    $0x10,%esp
 3b8:	39 de                	cmp    %ebx,%esi
 3ba:	75 e4                	jne    3a0 <printint+0x70>
    putc(fd, buf[i]);
}
 3bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3bf:	5b                   	pop    %ebx
 3c0:	5e                   	pop    %esi
 3c1:	5f                   	pop    %edi
 3c2:	5d                   	pop    %ebp
 3c3:	c3                   	ret    
 3c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 3c8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 3cf:	eb 87                	jmp    358 <printint+0x28>
 3d1:	eb 0d                	jmp    3e0 <printf>
 3d3:	90                   	nop
 3d4:	90                   	nop
 3d5:	90                   	nop
 3d6:	90                   	nop
 3d7:	90                   	nop
 3d8:	90                   	nop
 3d9:	90                   	nop
 3da:	90                   	nop
 3db:	90                   	nop
 3dc:	90                   	nop
 3dd:	90                   	nop
 3de:	90                   	nop
 3df:	90                   	nop

000003e0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	57                   	push   %edi
 3e4:	56                   	push   %esi
 3e5:	53                   	push   %ebx
 3e6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 3e9:	8b 75 0c             	mov    0xc(%ebp),%esi
 3ec:	0f b6 1e             	movzbl (%esi),%ebx
 3ef:	84 db                	test   %bl,%bl
 3f1:	0f 84 b8 00 00 00    	je     4af <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 3f7:	8d 45 10             	lea    0x10(%ebp),%eax
 3fa:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 3fd:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 400:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 402:	89 45 d0             	mov    %eax,-0x30(%ebp)
 405:	eb 37                	jmp    43e <printf+0x5e>
 407:	89 f6                	mov    %esi,%esi
 409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 410:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 413:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 418:	83 f8 25             	cmp    $0x25,%eax
 41b:	74 17                	je     434 <printf+0x54>
  write(fd, &c, 1);
 41d:	83 ec 04             	sub    $0x4,%esp
 420:	88 5d e7             	mov    %bl,-0x19(%ebp)
 423:	6a 01                	push   $0x1
 425:	57                   	push   %edi
 426:	ff 75 08             	pushl  0x8(%ebp)
 429:	e8 75 fe ff ff       	call   2a3 <write>
 42e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 431:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 434:	0f b6 1e             	movzbl (%esi),%ebx
 437:	83 c6 01             	add    $0x1,%esi
 43a:	84 db                	test   %bl,%bl
 43c:	74 71                	je     4af <printf+0xcf>
    c = fmt[i] & 0xff;
 43e:	0f be cb             	movsbl %bl,%ecx
 441:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 444:	85 d2                	test   %edx,%edx
 446:	74 c8                	je     410 <printf+0x30>
      }
    } else if(state == '%'){
 448:	83 fa 25             	cmp    $0x25,%edx
 44b:	75 e7                	jne    434 <printf+0x54>
      if(c == 'd'){
 44d:	83 f8 64             	cmp    $0x64,%eax
 450:	0f 84 9a 00 00 00    	je     4f0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 456:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 45c:	83 f9 70             	cmp    $0x70,%ecx
 45f:	74 5f                	je     4c0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 461:	83 f8 73             	cmp    $0x73,%eax
 464:	0f 84 d6 00 00 00    	je     540 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 46a:	83 f8 63             	cmp    $0x63,%eax
 46d:	0f 84 8d 00 00 00    	je     500 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 473:	83 f8 25             	cmp    $0x25,%eax
 476:	0f 84 b4 00 00 00    	je     530 <printf+0x150>
  write(fd, &c, 1);
 47c:	83 ec 04             	sub    $0x4,%esp
 47f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 483:	6a 01                	push   $0x1
 485:	57                   	push   %edi
 486:	ff 75 08             	pushl  0x8(%ebp)
 489:	e8 15 fe ff ff       	call   2a3 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 48e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 491:	83 c4 0c             	add    $0xc,%esp
 494:	6a 01                	push   $0x1
 496:	83 c6 01             	add    $0x1,%esi
 499:	57                   	push   %edi
 49a:	ff 75 08             	pushl  0x8(%ebp)
 49d:	e8 01 fe ff ff       	call   2a3 <write>
  for(i = 0; fmt[i]; i++){
 4a2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 4a6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 4a9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 4ab:	84 db                	test   %bl,%bl
 4ad:	75 8f                	jne    43e <printf+0x5e>
    }
  }
}
 4af:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4b2:	5b                   	pop    %ebx
 4b3:	5e                   	pop    %esi
 4b4:	5f                   	pop    %edi
 4b5:	5d                   	pop    %ebp
 4b6:	c3                   	ret    
 4b7:	89 f6                	mov    %esi,%esi
 4b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        printint(fd, *ap, 16, 0);
 4c0:	83 ec 0c             	sub    $0xc,%esp
 4c3:	b9 10 00 00 00       	mov    $0x10,%ecx
 4c8:	6a 00                	push   $0x0
 4ca:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 4cd:	8b 45 08             	mov    0x8(%ebp),%eax
 4d0:	8b 13                	mov    (%ebx),%edx
 4d2:	e8 59 fe ff ff       	call   330 <printint>
        ap++;
 4d7:	89 d8                	mov    %ebx,%eax
 4d9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4dc:	31 d2                	xor    %edx,%edx
        ap++;
 4de:	83 c0 04             	add    $0x4,%eax
 4e1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4e4:	e9 4b ff ff ff       	jmp    434 <printf+0x54>
 4e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 4f0:	83 ec 0c             	sub    $0xc,%esp
 4f3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 4f8:	6a 01                	push   $0x1
 4fa:	eb ce                	jmp    4ca <printf+0xea>
 4fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 500:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 503:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 506:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 508:	6a 01                	push   $0x1
        ap++;
 50a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 50d:	57                   	push   %edi
 50e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 511:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 514:	e8 8a fd ff ff       	call   2a3 <write>
        ap++;
 519:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 51c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 51f:	31 d2                	xor    %edx,%edx
 521:	e9 0e ff ff ff       	jmp    434 <printf+0x54>
 526:	8d 76 00             	lea    0x0(%esi),%esi
 529:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        putc(fd, c);
 530:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 533:	83 ec 04             	sub    $0x4,%esp
 536:	e9 59 ff ff ff       	jmp    494 <printf+0xb4>
 53b:	90                   	nop
 53c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 540:	8b 45 d0             	mov    -0x30(%ebp),%eax
 543:	8b 18                	mov    (%eax),%ebx
        ap++;
 545:	83 c0 04             	add    $0x4,%eax
 548:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 54b:	85 db                	test   %ebx,%ebx
 54d:	74 17                	je     566 <printf+0x186>
        while(*s != 0){
 54f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 552:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 554:	84 c0                	test   %al,%al
 556:	0f 84 d8 fe ff ff    	je     434 <printf+0x54>
 55c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 55f:	89 de                	mov    %ebx,%esi
 561:	8b 5d 08             	mov    0x8(%ebp),%ebx
 564:	eb 1a                	jmp    580 <printf+0x1a0>
          s = "(null)";
 566:	bb a4 08 00 00       	mov    $0x8a4,%ebx
        while(*s != 0){
 56b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 56e:	b8 28 00 00 00       	mov    $0x28,%eax
 573:	89 de                	mov    %ebx,%esi
 575:	8b 5d 08             	mov    0x8(%ebp),%ebx
 578:	90                   	nop
 579:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 580:	83 ec 04             	sub    $0x4,%esp
          s++;
 583:	83 c6 01             	add    $0x1,%esi
 586:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 589:	6a 01                	push   $0x1
 58b:	57                   	push   %edi
 58c:	53                   	push   %ebx
 58d:	e8 11 fd ff ff       	call   2a3 <write>
        while(*s != 0){
 592:	0f b6 06             	movzbl (%esi),%eax
 595:	83 c4 10             	add    $0x10,%esp
 598:	84 c0                	test   %al,%al
 59a:	75 e4                	jne    580 <printf+0x1a0>
 59c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 59f:	31 d2                	xor    %edx,%edx
 5a1:	e9 8e fe ff ff       	jmp    434 <printf+0x54>
 5a6:	66 90                	xchg   %ax,%ax
 5a8:	66 90                	xchg   %ax,%ax
 5aa:	66 90                	xchg   %ax,%ax
 5ac:	66 90                	xchg   %ax,%ax
 5ae:	66 90                	xchg   %ax,%ax

000005b0 <print_free_list>:
static Header base;
static Header *freep;

// print free list status
void
print_free_list(){
 5b0:	55                   	push   %ebp
 5b1:	89 e5                	mov    %esp,%ebp
 5b3:	53                   	push   %ebx
 5b4:	83 ec 0c             	sub    $0xc,%esp
  Header* p;
  printf(1, "Header -> ");
 5b7:	68 bd 08 00 00       	push   $0x8bd
 5bc:	6a 01                	push   $0x1
 5be:	e8 1d fe ff ff       	call   3e0 <printf>
  if(freep == 0){ 
 5c3:	a1 f4 0b 00 00       	mov    0xbf4,%eax
 5c8:	83 c4 10             	add    $0x10,%esp
 5cb:	85 c0                	test   %eax,%eax
 5cd:	74 30                	je     5ff <print_free_list+0x4f>
    printf(1, "NULL\n");
    return;
  }
  for(p = base.s.ptr; p != &base; p = p->s.ptr){
 5cf:	8b 1d f8 0b 00 00    	mov    0xbf8,%ebx
 5d5:	81 fb f8 0b 00 00    	cmp    $0xbf8,%ebx
 5db:	74 22                	je     5ff <print_free_list+0x4f>
 5dd:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "%d -> ", p->s.size);
 5e0:	83 ec 04             	sub    $0x4,%esp
 5e3:	ff 73 04             	pushl  0x4(%ebx)
 5e6:	68 ce 08 00 00       	push   $0x8ce
 5eb:	6a 01                	push   $0x1
 5ed:	e8 ee fd ff ff       	call   3e0 <printf>
  for(p = base.s.ptr; p != &base; p = p->s.ptr){
 5f2:	8b 1b                	mov    (%ebx),%ebx
 5f4:	83 c4 10             	add    $0x10,%esp
 5f7:	81 fb f8 0b 00 00    	cmp    $0xbf8,%ebx
 5fd:	75 e1                	jne    5e0 <print_free_list+0x30>
    printf(1, "NULL\n");
 5ff:	83 ec 08             	sub    $0x8,%esp
 602:	68 c8 08 00 00       	push   $0x8c8
 607:	6a 01                	push   $0x1
 609:	e8 d2 fd ff ff       	call   3e0 <printf>
  }
  printf(1, "NULL\n");
}
 60e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 611:	c9                   	leave  
 612:	c3                   	ret    
 613:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 619:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000620 <free>:

void
free(void *ap)
{
 620:	55                   	push   %ebp
  Header *bp, *p;
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 621:	a1 f4 0b 00 00       	mov    0xbf4,%eax
{
 626:	89 e5                	mov    %esp,%ebp
 628:	57                   	push   %edi
 629:	56                   	push   %esi
 62a:	53                   	push   %ebx
 62b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 62e:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 630:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 633:	39 c8                	cmp    %ecx,%eax
 635:	73 19                	jae    650 <free+0x30>
 637:	89 f6                	mov    %esi,%esi
 639:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 640:	39 d1                	cmp    %edx,%ecx
 642:	72 14                	jb     658 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 644:	39 d0                	cmp    %edx,%eax
 646:	73 10                	jae    658 <free+0x38>
{
 648:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 64a:	8b 10                	mov    (%eax),%edx
 64c:	39 c8                	cmp    %ecx,%eax
 64e:	72 f0                	jb     640 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 650:	39 d0                	cmp    %edx,%eax
 652:	72 f4                	jb     648 <free+0x28>
 654:	39 d1                	cmp    %edx,%ecx
 656:	73 f0                	jae    648 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 658:	8b 73 fc             	mov    -0x4(%ebx),%esi
 65b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 65e:	39 fa                	cmp    %edi,%edx
 660:	74 1e                	je     680 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 662:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 665:	8b 50 04             	mov    0x4(%eax),%edx
 668:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 66b:	39 f1                	cmp    %esi,%ecx
 66d:	74 28                	je     697 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 66f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 671:	5b                   	pop    %ebx
  freep = p;
 672:	a3 f4 0b 00 00       	mov    %eax,0xbf4
}
 677:	5e                   	pop    %esi
 678:	5f                   	pop    %edi
 679:	5d                   	pop    %ebp
 67a:	c3                   	ret    
 67b:	90                   	nop
 67c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 680:	03 72 04             	add    0x4(%edx),%esi
 683:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 686:	8b 10                	mov    (%eax),%edx
 688:	8b 12                	mov    (%edx),%edx
 68a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 68d:	8b 50 04             	mov    0x4(%eax),%edx
 690:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 693:	39 f1                	cmp    %esi,%ecx
 695:	75 d8                	jne    66f <free+0x4f>
    p->s.size += bp->s.size;
 697:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 69a:	a3 f4 0b 00 00       	mov    %eax,0xbf4
    p->s.size += bp->s.size;
 69f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6a2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6a5:	89 10                	mov    %edx,(%eax)
}
 6a7:	5b                   	pop    %ebx
 6a8:	5e                   	pop    %esi
 6a9:	5f                   	pop    %edi
 6aa:	5d                   	pop    %ebp
 6ab:	c3                   	ret    
 6ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000006b0 <morecore>:

static Header*
morecore(uint nu)
{
 6b0:	55                   	push   %ebp
 6b1:	89 e5                	mov    %esp,%ebp
 6b3:	53                   	push   %ebx
 6b4:	bb 00 10 00 00       	mov    $0x1000,%ebx
 6b9:	83 ec 10             	sub    $0x10,%esp
 6bc:	3d 00 10 00 00       	cmp    $0x1000,%eax
 6c1:	0f 43 d8             	cmovae %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 6c4:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 6cb:	50                   	push   %eax
 6cc:	e8 3a fc ff ff       	call   30b <sbrk>
  if(p == (char*)-1)
 6d1:	83 c4 10             	add    $0x10,%esp
 6d4:	83 f8 ff             	cmp    $0xffffffff,%eax
 6d7:	74 1f                	je     6f8 <morecore+0x48>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 6d9:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6dc:	83 ec 0c             	sub    $0xc,%esp
 6df:	83 c0 08             	add    $0x8,%eax
 6e2:	50                   	push   %eax
 6e3:	e8 38 ff ff ff       	call   620 <free>
  return freep;
 6e8:	a1 f4 0b 00 00       	mov    0xbf4,%eax
}
 6ed:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  return freep;
 6f0:	83 c4 10             	add    $0x10,%esp
}
 6f3:	c9                   	leave  
 6f4:	c3                   	ret    
 6f5:	8d 76 00             	lea    0x0(%esi),%esi
 6f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return 0;
 6fb:	31 c0                	xor    %eax,%eax
}
 6fd:	c9                   	leave  
 6fe:	c3                   	ret    
 6ff:	90                   	nop

00000700 <malloc>:

void*
malloc(uint nbytes)
{
 700:	55                   	push   %ebp
  Header *p, *prevp;
  uint nunits;
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 701:	8b 0d f4 0b 00 00    	mov    0xbf4,%ecx
{
 707:	89 e5                	mov    %esp,%ebp
 709:	56                   	push   %esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 70a:	8b 45 08             	mov    0x8(%ebp),%eax
{
 70d:	53                   	push   %ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 70e:	8d 58 07             	lea    0x7(%eax),%ebx
 711:	c1 eb 03             	shr    $0x3,%ebx
 714:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 717:	85 c9                	test   %ecx,%ecx
 719:	74 65                	je     780 <malloc+0x80>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 71b:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 71d:	8b 50 04             	mov    0x4(%eax),%edx
 720:	39 d3                	cmp    %edx,%ebx
 722:	77 1d                	ja     741 <malloc+0x41>
 724:	eb 2e                	jmp    754 <malloc+0x54>
 726:	8d 76 00             	lea    0x0(%esi),%esi
 729:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 730:	8b 30                	mov    (%eax),%esi
    if(p->s.size >= nunits){
 732:	8b 56 04             	mov    0x4(%esi),%edx
 735:	39 da                	cmp    %ebx,%edx
 737:	73 27                	jae    760 <malloc+0x60>
 739:	8b 0d f4 0b 00 00    	mov    0xbf4,%ecx
 73f:	89 f0                	mov    %esi,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 741:	39 c1                	cmp    %eax,%ecx
 743:	75 eb                	jne    730 <malloc+0x30>
      if((p = morecore(nunits)) == 0)
 745:	89 d8                	mov    %ebx,%eax
 747:	e8 64 ff ff ff       	call   6b0 <morecore>
 74c:	85 c0                	test   %eax,%eax
 74e:	75 e0                	jne    730 <malloc+0x30>
        return 0;
  }
}
 750:	5b                   	pop    %ebx
 751:	5e                   	pop    %esi
 752:	5d                   	pop    %ebp
 753:	c3                   	ret    
    if(p->s.size >= nunits){
 754:	89 c6                	mov    %eax,%esi
 756:	89 c8                	mov    %ecx,%eax
 758:	90                   	nop
 759:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 760:	39 d3                	cmp    %edx,%ebx
 762:	74 4c                	je     7b0 <malloc+0xb0>
        p->s.size -= nunits;
 764:	29 da                	sub    %ebx,%edx
 766:	89 56 04             	mov    %edx,0x4(%esi)
        p += p->s.size;
 769:	8d 34 d6             	lea    (%esi,%edx,8),%esi
        p->s.size = nunits;
 76c:	89 5e 04             	mov    %ebx,0x4(%esi)
}
 76f:	5b                   	pop    %ebx
      freep = prevp;
 770:	a3 f4 0b 00 00       	mov    %eax,0xbf4
      return (void*)(p + 1);
 775:	8d 46 08             	lea    0x8(%esi),%eax
}
 778:	5e                   	pop    %esi
 779:	5d                   	pop    %ebp
 77a:	c3                   	ret    
 77b:	90                   	nop
 77c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 780:	c7 05 f4 0b 00 00 f8 	movl   $0xbf8,0xbf4
 787:	0b 00 00 
    base.s.size = 0;
 78a:	b9 f8 0b 00 00       	mov    $0xbf8,%ecx
    base.s.ptr = freep = prevp = &base;
 78f:	c7 05 f8 0b 00 00 f8 	movl   $0xbf8,0xbf8
 796:	0b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 799:	89 c8                	mov    %ecx,%eax
    base.s.size = 0;
 79b:	c7 05 fc 0b 00 00 00 	movl   $0x0,0xbfc
 7a2:	00 00 00 
    if(p->s.size >= nunits){
 7a5:	eb 9a                	jmp    741 <malloc+0x41>
 7a7:	89 f6                	mov    %esi,%esi
 7a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        prevp->s.ptr = p->s.ptr;
 7b0:	8b 16                	mov    (%esi),%edx
 7b2:	89 10                	mov    %edx,(%eax)
 7b4:	eb b9                	jmp    76f <malloc+0x6f>
 7b6:	8d 76 00             	lea    0x0(%esi),%esi
 7b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000007c0 <malloc_wf>:

// modify malloc to implement 'worst fit' strategy
void*
malloc_wf(uint nbytes)
{
 7c0:	55                   	push   %ebp
 7c1:	89 e5                	mov    %esp,%ebp
 7c3:	57                   	push   %edi
 7c4:	56                   	push   %esi
 7c5:	53                   	push   %ebx
 7c6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp, *maxp, *maxprevp;
  uint nunits;
  uint max = 0;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7c9:	8b 45 08             	mov    0x8(%ebp),%eax
 7cc:	83 c0 07             	add    $0x7,%eax
 7cf:	c1 e8 03             	shr    $0x3,%eax
 7d2:	83 c0 01             	add    $0x1,%eax
 7d5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 7d8:	90                   	nop
 7d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  if((prevp = freep) == 0){
 7e0:	8b 1d f4 0b 00 00    	mov    0xbf4,%ebx
 7e6:	85 db                	test   %ebx,%ebx
 7e8:	74 66                	je     850 <malloc_wf+0x90>
 7ea:	8b 03                	mov    (%ebx),%eax
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }

  maxp = 0;
  maxprevp = 0;
 7ec:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  if((prevp = freep) == 0){
 7f3:	89 df                	mov    %ebx,%edi
  uint max = 0;
 7f5:	31 f6                	xor    %esi,%esi
  maxp = 0;
 7f7:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
 7fe:	8b 50 04             	mov    0x4(%eax),%edx
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 801:	eb 12                	jmp    815 <malloc_wf+0x55>
 803:	90                   	nop
 804:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p->s.size >= nunits && p->s.size > max){
      max = p->s.size;
      maxp = p;
      maxprevp = prevp;
    }
    if(p == freep)
 808:	39 d8                	cmp    %ebx,%eax
 80a:	74 24                	je     830 <malloc_wf+0x70>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 80c:	8b 08                	mov    (%eax),%ecx
    if(p->s.size >= nunits && p->s.size > max){
 80e:	89 c7                	mov    %eax,%edi
 810:	8b 51 04             	mov    0x4(%ecx),%edx
 813:	89 c8                	mov    %ecx,%eax
 815:	39 d6                	cmp    %edx,%esi
 817:	73 ef                	jae    808 <malloc_wf+0x48>
 819:	39 55 e4             	cmp    %edx,-0x1c(%ebp)
 81c:	77 ea                	ja     808 <malloc_wf+0x48>
    if(p == freep)
 81e:	39 d8                	cmp    %ebx,%eax
 820:	74 57                	je     879 <malloc_wf+0xb9>
 822:	89 7d dc             	mov    %edi,-0x24(%ebp)
 825:	89 d6                	mov    %edx,%esi
 827:	89 45 e0             	mov    %eax,-0x20(%ebp)
 82a:	eb e0                	jmp    80c <malloc_wf+0x4c>
 82c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      break;
  }

  if(maxp != 0){
 830:	8b 45 e0             	mov    -0x20(%ebp),%eax
 833:	85 c0                	test   %eax,%eax
 835:	75 39                	jne    870 <malloc_wf+0xb0>
      p->s.size = nunits;
    }
    freep = prevp;
    return (void*)(p + 1);
  } else {
    if((p = morecore(nunits)) == 0)
 837:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 83a:	e8 71 fe ff ff       	call   6b0 <morecore>
 83f:	85 c0                	test   %eax,%eax
 841:	75 9d                	jne    7e0 <malloc_wf+0x20>
      return 0;
    return malloc_wf(nbytes);
  }
 843:	83 c4 1c             	add    $0x1c,%esp
 846:	5b                   	pop    %ebx
 847:	5e                   	pop    %esi
 848:	5f                   	pop    %edi
 849:	5d                   	pop    %ebp
 84a:	c3                   	ret    
 84b:	90                   	nop
 84c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 850:	c7 05 f4 0b 00 00 f8 	movl   $0xbf8,0xbf4
 857:	0b 00 00 
 85a:	c7 05 f8 0b 00 00 f8 	movl   $0xbf8,0xbf8
 861:	0b 00 00 
    base.s.size = 0;
 864:	c7 05 fc 0b 00 00 00 	movl   $0x0,0xbfc
 86b:	00 00 00 
  if(maxp != 0){
 86e:	eb c7                	jmp    837 <malloc_wf+0x77>
 870:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 873:	8b 7d dc             	mov    -0x24(%ebp),%edi
 876:	8b 53 04             	mov    0x4(%ebx),%edx
    if(p->s.size == nunits){
 879:	39 55 e4             	cmp    %edx,-0x1c(%ebp)
 87c:	74 1f                	je     89d <malloc_wf+0xdd>
      p->s.size -= nunits;
 87e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 881:	29 c2                	sub    %eax,%edx
 883:	89 53 04             	mov    %edx,0x4(%ebx)
      p = p + p->s.size;
 886:	8d 1c d3             	lea    (%ebx,%edx,8),%ebx
      p->s.size = nunits;
 889:	89 43 04             	mov    %eax,0x4(%ebx)
    freep = prevp;
 88c:	89 3d f4 0b 00 00    	mov    %edi,0xbf4
 892:	83 c4 1c             	add    $0x1c,%esp
    return (void*)(p + 1);
 895:	8d 43 08             	lea    0x8(%ebx),%eax
 898:	5b                   	pop    %ebx
 899:	5e                   	pop    %esi
 89a:	5f                   	pop    %edi
 89b:	5d                   	pop    %ebp
 89c:	c3                   	ret    
      prevp->s.ptr = p->s.ptr;
 89d:	8b 03                	mov    (%ebx),%eax
 89f:	89 07                	mov    %eax,(%edi)
 8a1:	eb e9                	jmp    88c <malloc_wf+0xcc>
