
_ln:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
  if(argc != 3){
   a:	83 39 03             	cmpl   $0x3,(%ecx)
{
   d:	55                   	push   %ebp
   e:	89 e5                	mov    %esp,%ebp
  10:	53                   	push   %ebx
  11:	51                   	push   %ecx
  12:	8b 59 04             	mov    0x4(%ecx),%ebx
  if(argc != 3){
  15:	74 13                	je     2a <main+0x2a>
    printf(2, "Usage: ln old new\n");
  17:	52                   	push   %edx
  18:	52                   	push   %edx
  19:	68 d4 08 00 00       	push   $0x8d4
  1e:	6a 02                	push   $0x2
  20:	e8 eb 03 00 00       	call   410 <printf>
    exit();
  25:	e8 89 02 00 00       	call   2b3 <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  2a:	50                   	push   %eax
  2b:	50                   	push   %eax
  2c:	ff 73 08             	pushl  0x8(%ebx)
  2f:	ff 73 04             	pushl  0x4(%ebx)
  32:	e8 dc 02 00 00       	call   313 <link>
  37:	83 c4 10             	add    $0x10,%esp
  3a:	85 c0                	test   %eax,%eax
  3c:	78 05                	js     43 <main+0x43>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  exit();
  3e:	e8 70 02 00 00       	call   2b3 <exit>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  43:	ff 73 08             	pushl  0x8(%ebx)
  46:	ff 73 04             	pushl  0x4(%ebx)
  49:	68 e7 08 00 00       	push   $0x8e7
  4e:	6a 02                	push   $0x2
  50:	e8 bb 03 00 00       	call   410 <printf>
  55:	83 c4 10             	add    $0x10,%esp
  58:	eb e4                	jmp    3e <main+0x3e>
  5a:	66 90                	xchg   %ax,%ax
  5c:	66 90                	xchg   %ax,%ax
  5e:	66 90                	xchg   %ax,%ax

00000060 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  60:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  61:	31 c0                	xor    %eax,%eax
{
  63:	89 e5                	mov    %esp,%ebp
  65:	53                   	push   %ebx
  66:	8b 4d 08             	mov    0x8(%ebp),%ecx
  69:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  70:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  74:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  77:	83 c0 01             	add    $0x1,%eax
  7a:	84 d2                	test   %dl,%dl
  7c:	75 f2                	jne    70 <strcpy+0x10>
    ;
  return os;
}
  7e:	89 c8                	mov    %ecx,%eax
  80:	5b                   	pop    %ebx
  81:	5d                   	pop    %ebp
  82:	c3                   	ret    
  83:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000090 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	53                   	push   %ebx
  94:	8b 4d 08             	mov    0x8(%ebp),%ecx
  97:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  9a:	0f b6 01             	movzbl (%ecx),%eax
  9d:	0f b6 1a             	movzbl (%edx),%ebx
  a0:	84 c0                	test   %al,%al
  a2:	75 1d                	jne    c1 <strcmp+0x31>
  a4:	eb 2a                	jmp    d0 <strcmp+0x40>
  a6:	8d 76 00             	lea    0x0(%esi),%esi
  a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  b0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
  b4:	83 c1 01             	add    $0x1,%ecx
  b7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  ba:	0f b6 1a             	movzbl (%edx),%ebx
  bd:	84 c0                	test   %al,%al
  bf:	74 0f                	je     d0 <strcmp+0x40>
  c1:	38 d8                	cmp    %bl,%al
  c3:	74 eb                	je     b0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
  c5:	29 d8                	sub    %ebx,%eax
}
  c7:	5b                   	pop    %ebx
  c8:	5d                   	pop    %ebp
  c9:	c3                   	ret    
  ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  d0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
  d2:	29 d8                	sub    %ebx,%eax
}
  d4:	5b                   	pop    %ebx
  d5:	5d                   	pop    %ebp
  d6:	c3                   	ret    
  d7:	89 f6                	mov    %esi,%esi
  d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000000e0 <strlen>:

uint
strlen(const char *s)
{
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  e3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
  e6:	80 3a 00             	cmpb   $0x0,(%edx)
  e9:	74 15                	je     100 <strlen+0x20>
  eb:	31 c0                	xor    %eax,%eax
  ed:	8d 76 00             	lea    0x0(%esi),%esi
  f0:	83 c0 01             	add    $0x1,%eax
  f3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  f7:	89 c1                	mov    %eax,%ecx
  f9:	75 f5                	jne    f0 <strlen+0x10>
    ;
  return n;
}
  fb:	89 c8                	mov    %ecx,%eax
  fd:	5d                   	pop    %ebp
  fe:	c3                   	ret    
  ff:	90                   	nop
  for(n = 0; s[n]; n++)
 100:	31 c9                	xor    %ecx,%ecx
}
 102:	5d                   	pop    %ebp
 103:	89 c8                	mov    %ecx,%eax
 105:	c3                   	ret    
 106:	8d 76 00             	lea    0x0(%esi),%esi
 109:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000110 <memset>:

void*
memset(void *dst, int c, uint n)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	57                   	push   %edi
 114:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 117:	8b 4d 10             	mov    0x10(%ebp),%ecx
 11a:	8b 45 0c             	mov    0xc(%ebp),%eax
 11d:	89 d7                	mov    %edx,%edi
 11f:	fc                   	cld    
 120:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 122:	89 d0                	mov    %edx,%eax
 124:	5f                   	pop    %edi
 125:	5d                   	pop    %ebp
 126:	c3                   	ret    
 127:	89 f6                	mov    %esi,%esi
 129:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000130 <strchr>:

char*
strchr(const char *s, char c)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	8b 45 08             	mov    0x8(%ebp),%eax
 136:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 13a:	0f b6 10             	movzbl (%eax),%edx
 13d:	84 d2                	test   %dl,%dl
 13f:	75 12                	jne    153 <strchr+0x23>
 141:	eb 1d                	jmp    160 <strchr+0x30>
 143:	90                   	nop
 144:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 148:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 14c:	83 c0 01             	add    $0x1,%eax
 14f:	84 d2                	test   %dl,%dl
 151:	74 0d                	je     160 <strchr+0x30>
    if(*s == c)
 153:	38 d1                	cmp    %dl,%cl
 155:	75 f1                	jne    148 <strchr+0x18>
      return (char*)s;
  return 0;
}
 157:	5d                   	pop    %ebp
 158:	c3                   	ret    
 159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 160:	31 c0                	xor    %eax,%eax
}
 162:	5d                   	pop    %ebp
 163:	c3                   	ret    
 164:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 16a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000170 <gets>:

char*
gets(char *buf, int max)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	57                   	push   %edi
 174:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 175:	31 f6                	xor    %esi,%esi
{
 177:	53                   	push   %ebx
 178:	89 f3                	mov    %esi,%ebx
 17a:	83 ec 1c             	sub    $0x1c,%esp
 17d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 180:	eb 2f                	jmp    1b1 <gets+0x41>
 182:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 188:	83 ec 04             	sub    $0x4,%esp
 18b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 18e:	6a 01                	push   $0x1
 190:	50                   	push   %eax
 191:	6a 00                	push   $0x0
 193:	e8 33 01 00 00       	call   2cb <read>
    if(cc < 1)
 198:	83 c4 10             	add    $0x10,%esp
 19b:	85 c0                	test   %eax,%eax
 19d:	7e 1c                	jle    1bb <gets+0x4b>
      break;
    buf[i++] = c;
 19f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1a3:	83 c7 01             	add    $0x1,%edi
 1a6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 1a9:	3c 0a                	cmp    $0xa,%al
 1ab:	74 23                	je     1d0 <gets+0x60>
 1ad:	3c 0d                	cmp    $0xd,%al
 1af:	74 1f                	je     1d0 <gets+0x60>
  for(i=0; i+1 < max; ){
 1b1:	83 c3 01             	add    $0x1,%ebx
 1b4:	89 fe                	mov    %edi,%esi
 1b6:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1b9:	7c cd                	jl     188 <gets+0x18>
 1bb:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 1bd:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 1c0:	c6 03 00             	movb   $0x0,(%ebx)
}
 1c3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1c6:	5b                   	pop    %ebx
 1c7:	5e                   	pop    %esi
 1c8:	5f                   	pop    %edi
 1c9:	5d                   	pop    %ebp
 1ca:	c3                   	ret    
 1cb:	90                   	nop
 1cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1d0:	8b 75 08             	mov    0x8(%ebp),%esi
 1d3:	8b 45 08             	mov    0x8(%ebp),%eax
 1d6:	01 de                	add    %ebx,%esi
 1d8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 1da:	c6 03 00             	movb   $0x0,(%ebx)
}
 1dd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1e0:	5b                   	pop    %ebx
 1e1:	5e                   	pop    %esi
 1e2:	5f                   	pop    %edi
 1e3:	5d                   	pop    %ebp
 1e4:	c3                   	ret    
 1e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001f0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	56                   	push   %esi
 1f4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f5:	83 ec 08             	sub    $0x8,%esp
 1f8:	6a 00                	push   $0x0
 1fa:	ff 75 08             	pushl  0x8(%ebp)
 1fd:	e8 f1 00 00 00       	call   2f3 <open>
  if(fd < 0)
 202:	83 c4 10             	add    $0x10,%esp
 205:	85 c0                	test   %eax,%eax
 207:	78 27                	js     230 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 209:	83 ec 08             	sub    $0x8,%esp
 20c:	ff 75 0c             	pushl  0xc(%ebp)
 20f:	89 c3                	mov    %eax,%ebx
 211:	50                   	push   %eax
 212:	e8 f4 00 00 00       	call   30b <fstat>
  close(fd);
 217:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 21a:	89 c6                	mov    %eax,%esi
  close(fd);
 21c:	e8 ba 00 00 00       	call   2db <close>
  return r;
 221:	83 c4 10             	add    $0x10,%esp
}
 224:	8d 65 f8             	lea    -0x8(%ebp),%esp
 227:	89 f0                	mov    %esi,%eax
 229:	5b                   	pop    %ebx
 22a:	5e                   	pop    %esi
 22b:	5d                   	pop    %ebp
 22c:	c3                   	ret    
 22d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 230:	be ff ff ff ff       	mov    $0xffffffff,%esi
 235:	eb ed                	jmp    224 <stat+0x34>
 237:	89 f6                	mov    %esi,%esi
 239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000240 <atoi>:

int
atoi(const char *s)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	53                   	push   %ebx
 244:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 247:	0f be 02             	movsbl (%edx),%eax
 24a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 24d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 250:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 255:	77 1e                	ja     275 <atoi+0x35>
 257:	89 f6                	mov    %esi,%esi
 259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 260:	83 c2 01             	add    $0x1,%edx
 263:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 266:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 26a:	0f be 02             	movsbl (%edx),%eax
 26d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 270:	80 fb 09             	cmp    $0x9,%bl
 273:	76 eb                	jbe    260 <atoi+0x20>
  return n;
}
 275:	89 c8                	mov    %ecx,%eax
 277:	5b                   	pop    %ebx
 278:	5d                   	pop    %ebp
 279:	c3                   	ret    
 27a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000280 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	57                   	push   %edi
 284:	8b 45 10             	mov    0x10(%ebp),%eax
 287:	8b 55 08             	mov    0x8(%ebp),%edx
 28a:	56                   	push   %esi
 28b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 28e:	85 c0                	test   %eax,%eax
 290:	7e 13                	jle    2a5 <memmove+0x25>
 292:	01 d0                	add    %edx,%eax
  dst = vdst;
 294:	89 d7                	mov    %edx,%edi
 296:	8d 76 00             	lea    0x0(%esi),%esi
 299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    *dst++ = *src++;
 2a0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2a1:	39 f8                	cmp    %edi,%eax
 2a3:	75 fb                	jne    2a0 <memmove+0x20>
  return vdst;
}
 2a5:	5e                   	pop    %esi
 2a6:	89 d0                	mov    %edx,%eax
 2a8:	5f                   	pop    %edi
 2a9:	5d                   	pop    %ebp
 2aa:	c3                   	ret    

000002ab <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2ab:	b8 01 00 00 00       	mov    $0x1,%eax
 2b0:	cd 40                	int    $0x40
 2b2:	c3                   	ret    

000002b3 <exit>:
SYSCALL(exit)
 2b3:	b8 02 00 00 00       	mov    $0x2,%eax
 2b8:	cd 40                	int    $0x40
 2ba:	c3                   	ret    

000002bb <wait>:
SYSCALL(wait)
 2bb:	b8 03 00 00 00       	mov    $0x3,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret    

000002c3 <pipe>:
SYSCALL(pipe)
 2c3:	b8 04 00 00 00       	mov    $0x4,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret    

000002cb <read>:
SYSCALL(read)
 2cb:	b8 05 00 00 00       	mov    $0x5,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <write>:
SYSCALL(write)
 2d3:	b8 10 00 00 00       	mov    $0x10,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <close>:
SYSCALL(close)
 2db:	b8 15 00 00 00       	mov    $0x15,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <kill>:
SYSCALL(kill)
 2e3:	b8 06 00 00 00       	mov    $0x6,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <exec>:
SYSCALL(exec)
 2eb:	b8 07 00 00 00       	mov    $0x7,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <open>:
SYSCALL(open)
 2f3:	b8 0f 00 00 00       	mov    $0xf,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <mknod>:
SYSCALL(mknod)
 2fb:	b8 11 00 00 00       	mov    $0x11,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <unlink>:
SYSCALL(unlink)
 303:	b8 12 00 00 00       	mov    $0x12,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <fstat>:
SYSCALL(fstat)
 30b:	b8 08 00 00 00       	mov    $0x8,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <link>:
SYSCALL(link)
 313:	b8 13 00 00 00       	mov    $0x13,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <mkdir>:
SYSCALL(mkdir)
 31b:	b8 14 00 00 00       	mov    $0x14,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <chdir>:
SYSCALL(chdir)
 323:	b8 09 00 00 00       	mov    $0x9,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <dup>:
SYSCALL(dup)
 32b:	b8 0a 00 00 00       	mov    $0xa,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <getpid>:
SYSCALL(getpid)
 333:	b8 0b 00 00 00       	mov    $0xb,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <sbrk>:
SYSCALL(sbrk)
 33b:	b8 0c 00 00 00       	mov    $0xc,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <sleep>:
SYSCALL(sleep)
 343:	b8 0d 00 00 00       	mov    $0xd,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <uptime>:
SYSCALL(uptime)
 34b:	b8 0e 00 00 00       	mov    $0xe,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <walkpt>:
SYSCALL(walkpt)
 353:	b8 16 00 00 00       	mov    $0x16,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret    
 35b:	66 90                	xchg   %ax,%ax
 35d:	66 90                	xchg   %ax,%ax
 35f:	90                   	nop

00000360 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	57                   	push   %edi
 364:	56                   	push   %esi
 365:	53                   	push   %ebx
 366:	83 ec 3c             	sub    $0x3c,%esp
 369:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 36c:	89 d1                	mov    %edx,%ecx
{
 36e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 371:	85 d2                	test   %edx,%edx
 373:	0f 89 7f 00 00 00    	jns    3f8 <printint+0x98>
 379:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 37d:	74 79                	je     3f8 <printint+0x98>
    neg = 1;
 37f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 386:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 388:	31 db                	xor    %ebx,%ebx
 38a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 38d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 390:	89 c8                	mov    %ecx,%eax
 392:	31 d2                	xor    %edx,%edx
 394:	89 cf                	mov    %ecx,%edi
 396:	f7 75 c4             	divl   -0x3c(%ebp)
 399:	0f b6 92 04 09 00 00 	movzbl 0x904(%edx),%edx
 3a0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 3a3:	89 d8                	mov    %ebx,%eax
 3a5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 3a8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 3ab:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 3ae:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 3b1:	76 dd                	jbe    390 <printint+0x30>
  if(neg)
 3b3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 3b6:	85 c9                	test   %ecx,%ecx
 3b8:	74 0c                	je     3c6 <printint+0x66>
    buf[i++] = '-';
 3ba:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 3bf:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 3c1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 3c6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 3c9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 3cd:	eb 07                	jmp    3d6 <printint+0x76>
 3cf:	90                   	nop
 3d0:	0f b6 13             	movzbl (%ebx),%edx
 3d3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 3d6:	83 ec 04             	sub    $0x4,%esp
 3d9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 3dc:	6a 01                	push   $0x1
 3de:	56                   	push   %esi
 3df:	57                   	push   %edi
 3e0:	e8 ee fe ff ff       	call   2d3 <write>
  while(--i >= 0)
 3e5:	83 c4 10             	add    $0x10,%esp
 3e8:	39 de                	cmp    %ebx,%esi
 3ea:	75 e4                	jne    3d0 <printint+0x70>
    putc(fd, buf[i]);
}
 3ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3ef:	5b                   	pop    %ebx
 3f0:	5e                   	pop    %esi
 3f1:	5f                   	pop    %edi
 3f2:	5d                   	pop    %ebp
 3f3:	c3                   	ret    
 3f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 3f8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 3ff:	eb 87                	jmp    388 <printint+0x28>
 401:	eb 0d                	jmp    410 <printf>
 403:	90                   	nop
 404:	90                   	nop
 405:	90                   	nop
 406:	90                   	nop
 407:	90                   	nop
 408:	90                   	nop
 409:	90                   	nop
 40a:	90                   	nop
 40b:	90                   	nop
 40c:	90                   	nop
 40d:	90                   	nop
 40e:	90                   	nop
 40f:	90                   	nop

00000410 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	57                   	push   %edi
 414:	56                   	push   %esi
 415:	53                   	push   %ebx
 416:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 419:	8b 75 0c             	mov    0xc(%ebp),%esi
 41c:	0f b6 1e             	movzbl (%esi),%ebx
 41f:	84 db                	test   %bl,%bl
 421:	0f 84 b8 00 00 00    	je     4df <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 427:	8d 45 10             	lea    0x10(%ebp),%eax
 42a:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 42d:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 430:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 432:	89 45 d0             	mov    %eax,-0x30(%ebp)
 435:	eb 37                	jmp    46e <printf+0x5e>
 437:	89 f6                	mov    %esi,%esi
 439:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 440:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 443:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 448:	83 f8 25             	cmp    $0x25,%eax
 44b:	74 17                	je     464 <printf+0x54>
  write(fd, &c, 1);
 44d:	83 ec 04             	sub    $0x4,%esp
 450:	88 5d e7             	mov    %bl,-0x19(%ebp)
 453:	6a 01                	push   $0x1
 455:	57                   	push   %edi
 456:	ff 75 08             	pushl  0x8(%ebp)
 459:	e8 75 fe ff ff       	call   2d3 <write>
 45e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 461:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 464:	0f b6 1e             	movzbl (%esi),%ebx
 467:	83 c6 01             	add    $0x1,%esi
 46a:	84 db                	test   %bl,%bl
 46c:	74 71                	je     4df <printf+0xcf>
    c = fmt[i] & 0xff;
 46e:	0f be cb             	movsbl %bl,%ecx
 471:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 474:	85 d2                	test   %edx,%edx
 476:	74 c8                	je     440 <printf+0x30>
      }
    } else if(state == '%'){
 478:	83 fa 25             	cmp    $0x25,%edx
 47b:	75 e7                	jne    464 <printf+0x54>
      if(c == 'd'){
 47d:	83 f8 64             	cmp    $0x64,%eax
 480:	0f 84 9a 00 00 00    	je     520 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 486:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 48c:	83 f9 70             	cmp    $0x70,%ecx
 48f:	74 5f                	je     4f0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 491:	83 f8 73             	cmp    $0x73,%eax
 494:	0f 84 d6 00 00 00    	je     570 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 49a:	83 f8 63             	cmp    $0x63,%eax
 49d:	0f 84 8d 00 00 00    	je     530 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 4a3:	83 f8 25             	cmp    $0x25,%eax
 4a6:	0f 84 b4 00 00 00    	je     560 <printf+0x150>
  write(fd, &c, 1);
 4ac:	83 ec 04             	sub    $0x4,%esp
 4af:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 4b3:	6a 01                	push   $0x1
 4b5:	57                   	push   %edi
 4b6:	ff 75 08             	pushl  0x8(%ebp)
 4b9:	e8 15 fe ff ff       	call   2d3 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 4be:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 4c1:	83 c4 0c             	add    $0xc,%esp
 4c4:	6a 01                	push   $0x1
 4c6:	83 c6 01             	add    $0x1,%esi
 4c9:	57                   	push   %edi
 4ca:	ff 75 08             	pushl  0x8(%ebp)
 4cd:	e8 01 fe ff ff       	call   2d3 <write>
  for(i = 0; fmt[i]; i++){
 4d2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 4d6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 4d9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 4db:	84 db                	test   %bl,%bl
 4dd:	75 8f                	jne    46e <printf+0x5e>
    }
  }
}
 4df:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4e2:	5b                   	pop    %ebx
 4e3:	5e                   	pop    %esi
 4e4:	5f                   	pop    %edi
 4e5:	5d                   	pop    %ebp
 4e6:	c3                   	ret    
 4e7:	89 f6                	mov    %esi,%esi
 4e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        printint(fd, *ap, 16, 0);
 4f0:	83 ec 0c             	sub    $0xc,%esp
 4f3:	b9 10 00 00 00       	mov    $0x10,%ecx
 4f8:	6a 00                	push   $0x0
 4fa:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 4fd:	8b 45 08             	mov    0x8(%ebp),%eax
 500:	8b 13                	mov    (%ebx),%edx
 502:	e8 59 fe ff ff       	call   360 <printint>
        ap++;
 507:	89 d8                	mov    %ebx,%eax
 509:	83 c4 10             	add    $0x10,%esp
      state = 0;
 50c:	31 d2                	xor    %edx,%edx
        ap++;
 50e:	83 c0 04             	add    $0x4,%eax
 511:	89 45 d0             	mov    %eax,-0x30(%ebp)
 514:	e9 4b ff ff ff       	jmp    464 <printf+0x54>
 519:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 520:	83 ec 0c             	sub    $0xc,%esp
 523:	b9 0a 00 00 00       	mov    $0xa,%ecx
 528:	6a 01                	push   $0x1
 52a:	eb ce                	jmp    4fa <printf+0xea>
 52c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 530:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 533:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 536:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 538:	6a 01                	push   $0x1
        ap++;
 53a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 53d:	57                   	push   %edi
 53e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 541:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 544:	e8 8a fd ff ff       	call   2d3 <write>
        ap++;
 549:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 54c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 54f:	31 d2                	xor    %edx,%edx
 551:	e9 0e ff ff ff       	jmp    464 <printf+0x54>
 556:	8d 76 00             	lea    0x0(%esi),%esi
 559:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        putc(fd, c);
 560:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 563:	83 ec 04             	sub    $0x4,%esp
 566:	e9 59 ff ff ff       	jmp    4c4 <printf+0xb4>
 56b:	90                   	nop
 56c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 570:	8b 45 d0             	mov    -0x30(%ebp),%eax
 573:	8b 18                	mov    (%eax),%ebx
        ap++;
 575:	83 c0 04             	add    $0x4,%eax
 578:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 57b:	85 db                	test   %ebx,%ebx
 57d:	74 17                	je     596 <printf+0x186>
        while(*s != 0){
 57f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 582:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 584:	84 c0                	test   %al,%al
 586:	0f 84 d8 fe ff ff    	je     464 <printf+0x54>
 58c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 58f:	89 de                	mov    %ebx,%esi
 591:	8b 5d 08             	mov    0x8(%ebp),%ebx
 594:	eb 1a                	jmp    5b0 <printf+0x1a0>
          s = "(null)";
 596:	bb fb 08 00 00       	mov    $0x8fb,%ebx
        while(*s != 0){
 59b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 59e:	b8 28 00 00 00       	mov    $0x28,%eax
 5a3:	89 de                	mov    %ebx,%esi
 5a5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 5a8:	90                   	nop
 5a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 5b0:	83 ec 04             	sub    $0x4,%esp
          s++;
 5b3:	83 c6 01             	add    $0x1,%esi
 5b6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 5b9:	6a 01                	push   $0x1
 5bb:	57                   	push   %edi
 5bc:	53                   	push   %ebx
 5bd:	e8 11 fd ff ff       	call   2d3 <write>
        while(*s != 0){
 5c2:	0f b6 06             	movzbl (%esi),%eax
 5c5:	83 c4 10             	add    $0x10,%esp
 5c8:	84 c0                	test   %al,%al
 5ca:	75 e4                	jne    5b0 <printf+0x1a0>
 5cc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 5cf:	31 d2                	xor    %edx,%edx
 5d1:	e9 8e fe ff ff       	jmp    464 <printf+0x54>
 5d6:	66 90                	xchg   %ax,%ax
 5d8:	66 90                	xchg   %ax,%ax
 5da:	66 90                	xchg   %ax,%ax
 5dc:	66 90                	xchg   %ax,%ax
 5de:	66 90                	xchg   %ax,%ax

000005e0 <print_free_list>:
static Header base;
static Header *freep;

// print free list status
void
print_free_list(){
 5e0:	55                   	push   %ebp
 5e1:	89 e5                	mov    %esp,%ebp
 5e3:	53                   	push   %ebx
 5e4:	83 ec 0c             	sub    $0xc,%esp
  Header* p;
  printf(1, "Header -> ");
 5e7:	68 15 09 00 00       	push   $0x915
 5ec:	6a 01                	push   $0x1
 5ee:	e8 1d fe ff ff       	call   410 <printf>
  if(freep == 0){ 
 5f3:	a1 50 0c 00 00       	mov    0xc50,%eax
 5f8:	83 c4 10             	add    $0x10,%esp
 5fb:	85 c0                	test   %eax,%eax
 5fd:	74 30                	je     62f <print_free_list+0x4f>
    printf(1, "NULL\n");
    return;
  }
  for(p = base.s.ptr; p != &base; p = p->s.ptr){
 5ff:	8b 1d 54 0c 00 00    	mov    0xc54,%ebx
 605:	81 fb 54 0c 00 00    	cmp    $0xc54,%ebx
 60b:	74 22                	je     62f <print_free_list+0x4f>
 60d:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "%d -> ", p->s.size);
 610:	83 ec 04             	sub    $0x4,%esp
 613:	ff 73 04             	pushl  0x4(%ebx)
 616:	68 26 09 00 00       	push   $0x926
 61b:	6a 01                	push   $0x1
 61d:	e8 ee fd ff ff       	call   410 <printf>
  for(p = base.s.ptr; p != &base; p = p->s.ptr){
 622:	8b 1b                	mov    (%ebx),%ebx
 624:	83 c4 10             	add    $0x10,%esp
 627:	81 fb 54 0c 00 00    	cmp    $0xc54,%ebx
 62d:	75 e1                	jne    610 <print_free_list+0x30>
    printf(1, "NULL\n");
 62f:	83 ec 08             	sub    $0x8,%esp
 632:	68 20 09 00 00       	push   $0x920
 637:	6a 01                	push   $0x1
 639:	e8 d2 fd ff ff       	call   410 <printf>
  }
  printf(1, "NULL\n");
}
 63e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 641:	c9                   	leave  
 642:	c3                   	ret    
 643:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 649:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000650 <free>:

void
free(void *ap)
{
 650:	55                   	push   %ebp
  Header *bp, *p;
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 651:	a1 50 0c 00 00       	mov    0xc50,%eax
{
 656:	89 e5                	mov    %esp,%ebp
 658:	57                   	push   %edi
 659:	56                   	push   %esi
 65a:	53                   	push   %ebx
 65b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 65e:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 660:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 663:	39 c8                	cmp    %ecx,%eax
 665:	73 19                	jae    680 <free+0x30>
 667:	89 f6                	mov    %esi,%esi
 669:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 670:	39 d1                	cmp    %edx,%ecx
 672:	72 14                	jb     688 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 674:	39 d0                	cmp    %edx,%eax
 676:	73 10                	jae    688 <free+0x38>
{
 678:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 67a:	8b 10                	mov    (%eax),%edx
 67c:	39 c8                	cmp    %ecx,%eax
 67e:	72 f0                	jb     670 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 680:	39 d0                	cmp    %edx,%eax
 682:	72 f4                	jb     678 <free+0x28>
 684:	39 d1                	cmp    %edx,%ecx
 686:	73 f0                	jae    678 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 688:	8b 73 fc             	mov    -0x4(%ebx),%esi
 68b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 68e:	39 fa                	cmp    %edi,%edx
 690:	74 1e                	je     6b0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 692:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 695:	8b 50 04             	mov    0x4(%eax),%edx
 698:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 69b:	39 f1                	cmp    %esi,%ecx
 69d:	74 28                	je     6c7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 69f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 6a1:	5b                   	pop    %ebx
  freep = p;
 6a2:	a3 50 0c 00 00       	mov    %eax,0xc50
}
 6a7:	5e                   	pop    %esi
 6a8:	5f                   	pop    %edi
 6a9:	5d                   	pop    %ebp
 6aa:	c3                   	ret    
 6ab:	90                   	nop
 6ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 6b0:	03 72 04             	add    0x4(%edx),%esi
 6b3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6b6:	8b 10                	mov    (%eax),%edx
 6b8:	8b 12                	mov    (%edx),%edx
 6ba:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6bd:	8b 50 04             	mov    0x4(%eax),%edx
 6c0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6c3:	39 f1                	cmp    %esi,%ecx
 6c5:	75 d8                	jne    69f <free+0x4f>
    p->s.size += bp->s.size;
 6c7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 6ca:	a3 50 0c 00 00       	mov    %eax,0xc50
    p->s.size += bp->s.size;
 6cf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6d2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6d5:	89 10                	mov    %edx,(%eax)
}
 6d7:	5b                   	pop    %ebx
 6d8:	5e                   	pop    %esi
 6d9:	5f                   	pop    %edi
 6da:	5d                   	pop    %ebp
 6db:	c3                   	ret    
 6dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000006e0 <morecore>:

static Header*
morecore(uint nu)
{
 6e0:	55                   	push   %ebp
 6e1:	89 e5                	mov    %esp,%ebp
 6e3:	53                   	push   %ebx
 6e4:	bb 00 10 00 00       	mov    $0x1000,%ebx
 6e9:	83 ec 10             	sub    $0x10,%esp
 6ec:	3d 00 10 00 00       	cmp    $0x1000,%eax
 6f1:	0f 43 d8             	cmovae %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 6f4:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 6fb:	50                   	push   %eax
 6fc:	e8 3a fc ff ff       	call   33b <sbrk>
  if(p == (char*)-1)
 701:	83 c4 10             	add    $0x10,%esp
 704:	83 f8 ff             	cmp    $0xffffffff,%eax
 707:	74 1f                	je     728 <morecore+0x48>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 709:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 70c:	83 ec 0c             	sub    $0xc,%esp
 70f:	83 c0 08             	add    $0x8,%eax
 712:	50                   	push   %eax
 713:	e8 38 ff ff ff       	call   650 <free>
  return freep;
 718:	a1 50 0c 00 00       	mov    0xc50,%eax
}
 71d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  return freep;
 720:	83 c4 10             	add    $0x10,%esp
}
 723:	c9                   	leave  
 724:	c3                   	ret    
 725:	8d 76 00             	lea    0x0(%esi),%esi
 728:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return 0;
 72b:	31 c0                	xor    %eax,%eax
}
 72d:	c9                   	leave  
 72e:	c3                   	ret    
 72f:	90                   	nop

00000730 <malloc>:

void*
malloc(uint nbytes)
{
 730:	55                   	push   %ebp
  Header *p, *prevp;
  uint nunits;
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 731:	8b 0d 50 0c 00 00    	mov    0xc50,%ecx
{
 737:	89 e5                	mov    %esp,%ebp
 739:	56                   	push   %esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 73a:	8b 45 08             	mov    0x8(%ebp),%eax
{
 73d:	53                   	push   %ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 73e:	8d 58 07             	lea    0x7(%eax),%ebx
 741:	c1 eb 03             	shr    $0x3,%ebx
 744:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 747:	85 c9                	test   %ecx,%ecx
 749:	74 65                	je     7b0 <malloc+0x80>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 74b:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 74d:	8b 50 04             	mov    0x4(%eax),%edx
 750:	39 d3                	cmp    %edx,%ebx
 752:	77 1d                	ja     771 <malloc+0x41>
 754:	eb 2e                	jmp    784 <malloc+0x54>
 756:	8d 76 00             	lea    0x0(%esi),%esi
 759:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 760:	8b 30                	mov    (%eax),%esi
    if(p->s.size >= nunits){
 762:	8b 56 04             	mov    0x4(%esi),%edx
 765:	39 da                	cmp    %ebx,%edx
 767:	73 27                	jae    790 <malloc+0x60>
 769:	8b 0d 50 0c 00 00    	mov    0xc50,%ecx
 76f:	89 f0                	mov    %esi,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 771:	39 c1                	cmp    %eax,%ecx
 773:	75 eb                	jne    760 <malloc+0x30>
      if((p = morecore(nunits)) == 0)
 775:	89 d8                	mov    %ebx,%eax
 777:	e8 64 ff ff ff       	call   6e0 <morecore>
 77c:	85 c0                	test   %eax,%eax
 77e:	75 e0                	jne    760 <malloc+0x30>
        return 0;
  }
}
 780:	5b                   	pop    %ebx
 781:	5e                   	pop    %esi
 782:	5d                   	pop    %ebp
 783:	c3                   	ret    
    if(p->s.size >= nunits){
 784:	89 c6                	mov    %eax,%esi
 786:	89 c8                	mov    %ecx,%eax
 788:	90                   	nop
 789:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 790:	39 d3                	cmp    %edx,%ebx
 792:	74 4c                	je     7e0 <malloc+0xb0>
        p->s.size -= nunits;
 794:	29 da                	sub    %ebx,%edx
 796:	89 56 04             	mov    %edx,0x4(%esi)
        p += p->s.size;
 799:	8d 34 d6             	lea    (%esi,%edx,8),%esi
        p->s.size = nunits;
 79c:	89 5e 04             	mov    %ebx,0x4(%esi)
}
 79f:	5b                   	pop    %ebx
      freep = prevp;
 7a0:	a3 50 0c 00 00       	mov    %eax,0xc50
      return (void*)(p + 1);
 7a5:	8d 46 08             	lea    0x8(%esi),%eax
}
 7a8:	5e                   	pop    %esi
 7a9:	5d                   	pop    %ebp
 7aa:	c3                   	ret    
 7ab:	90                   	nop
 7ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 7b0:	c7 05 50 0c 00 00 54 	movl   $0xc54,0xc50
 7b7:	0c 00 00 
    base.s.size = 0;
 7ba:	b9 54 0c 00 00       	mov    $0xc54,%ecx
    base.s.ptr = freep = prevp = &base;
 7bf:	c7 05 54 0c 00 00 54 	movl   $0xc54,0xc54
 7c6:	0c 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7c9:	89 c8                	mov    %ecx,%eax
    base.s.size = 0;
 7cb:	c7 05 58 0c 00 00 00 	movl   $0x0,0xc58
 7d2:	00 00 00 
    if(p->s.size >= nunits){
 7d5:	eb 9a                	jmp    771 <malloc+0x41>
 7d7:	89 f6                	mov    %esi,%esi
 7d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        prevp->s.ptr = p->s.ptr;
 7e0:	8b 16                	mov    (%esi),%edx
 7e2:	89 10                	mov    %edx,(%eax)
 7e4:	eb b9                	jmp    79f <malloc+0x6f>
 7e6:	8d 76 00             	lea    0x0(%esi),%esi
 7e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000007f0 <malloc_wf>:

// modify malloc to implement 'worst fit' strategy
void*
malloc_wf(uint nbytes)
{
 7f0:	55                   	push   %ebp
 7f1:	89 e5                	mov    %esp,%ebp
 7f3:	57                   	push   %edi
 7f4:	56                   	push   %esi
 7f5:	53                   	push   %ebx
 7f6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp, *maxp, *maxprevp;
  uint nunits;
  uint max = 0;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7f9:	8b 45 08             	mov    0x8(%ebp),%eax
 7fc:	83 c0 07             	add    $0x7,%eax
 7ff:	c1 e8 03             	shr    $0x3,%eax
 802:	83 c0 01             	add    $0x1,%eax
 805:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 808:	90                   	nop
 809:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  if((prevp = freep) == 0){
 810:	8b 1d 50 0c 00 00    	mov    0xc50,%ebx
 816:	85 db                	test   %ebx,%ebx
 818:	74 66                	je     880 <malloc_wf+0x90>
 81a:	8b 03                	mov    (%ebx),%eax
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }

  maxp = 0;
  maxprevp = 0;
 81c:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  if((prevp = freep) == 0){
 823:	89 df                	mov    %ebx,%edi
  uint max = 0;
 825:	31 f6                	xor    %esi,%esi
  maxp = 0;
 827:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
 82e:	8b 50 04             	mov    0x4(%eax),%edx
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 831:	eb 12                	jmp    845 <malloc_wf+0x55>
 833:	90                   	nop
 834:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p->s.size >= nunits && p->s.size > max){
      max = p->s.size;
      maxp = p;
      maxprevp = prevp;
    }
    if(p == freep)
 838:	39 d8                	cmp    %ebx,%eax
 83a:	74 24                	je     860 <malloc_wf+0x70>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 83c:	8b 08                	mov    (%eax),%ecx
    if(p->s.size >= nunits && p->s.size > max){
 83e:	89 c7                	mov    %eax,%edi
 840:	8b 51 04             	mov    0x4(%ecx),%edx
 843:	89 c8                	mov    %ecx,%eax
 845:	39 d6                	cmp    %edx,%esi
 847:	73 ef                	jae    838 <malloc_wf+0x48>
 849:	39 55 e4             	cmp    %edx,-0x1c(%ebp)
 84c:	77 ea                	ja     838 <malloc_wf+0x48>
    if(p == freep)
 84e:	39 d8                	cmp    %ebx,%eax
 850:	74 57                	je     8a9 <malloc_wf+0xb9>
 852:	89 7d dc             	mov    %edi,-0x24(%ebp)
 855:	89 d6                	mov    %edx,%esi
 857:	89 45 e0             	mov    %eax,-0x20(%ebp)
 85a:	eb e0                	jmp    83c <malloc_wf+0x4c>
 85c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      break;
  }

  if(maxp != 0){
 860:	8b 45 e0             	mov    -0x20(%ebp),%eax
 863:	85 c0                	test   %eax,%eax
 865:	75 39                	jne    8a0 <malloc_wf+0xb0>
      p->s.size = nunits;
    }
    freep = prevp;
    return (void*)(p + 1);
  } else {
    if((p = morecore(nunits)) == 0)
 867:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 86a:	e8 71 fe ff ff       	call   6e0 <morecore>
 86f:	85 c0                	test   %eax,%eax
 871:	75 9d                	jne    810 <malloc_wf+0x20>
      return 0;
    return malloc_wf(nbytes);
  }
 873:	83 c4 1c             	add    $0x1c,%esp
 876:	5b                   	pop    %ebx
 877:	5e                   	pop    %esi
 878:	5f                   	pop    %edi
 879:	5d                   	pop    %ebp
 87a:	c3                   	ret    
 87b:	90                   	nop
 87c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 880:	c7 05 50 0c 00 00 54 	movl   $0xc54,0xc50
 887:	0c 00 00 
 88a:	c7 05 54 0c 00 00 54 	movl   $0xc54,0xc54
 891:	0c 00 00 
    base.s.size = 0;
 894:	c7 05 58 0c 00 00 00 	movl   $0x0,0xc58
 89b:	00 00 00 
  if(maxp != 0){
 89e:	eb c7                	jmp    867 <malloc_wf+0x77>
 8a0:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 8a3:	8b 7d dc             	mov    -0x24(%ebp),%edi
 8a6:	8b 53 04             	mov    0x4(%ebx),%edx
    if(p->s.size == nunits){
 8a9:	39 55 e4             	cmp    %edx,-0x1c(%ebp)
 8ac:	74 1f                	je     8cd <malloc_wf+0xdd>
      p->s.size -= nunits;
 8ae:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8b1:	29 c2                	sub    %eax,%edx
 8b3:	89 53 04             	mov    %edx,0x4(%ebx)
      p = p + p->s.size;
 8b6:	8d 1c d3             	lea    (%ebx,%edx,8),%ebx
      p->s.size = nunits;
 8b9:	89 43 04             	mov    %eax,0x4(%ebx)
    freep = prevp;
 8bc:	89 3d 50 0c 00 00    	mov    %edi,0xc50
 8c2:	83 c4 1c             	add    $0x1c,%esp
    return (void*)(p + 1);
 8c5:	8d 43 08             	lea    0x8(%ebx),%eax
 8c8:	5b                   	pop    %ebx
 8c9:	5e                   	pop    %esi
 8ca:	5f                   	pop    %edi
 8cb:	5d                   	pop    %ebp
 8cc:	c3                   	ret    
      prevp->s.ptr = p->s.ptr;
 8cd:	8b 03                	mov    (%ebx),%eax
 8cf:	89 07                	mov    %eax,(%edi)
 8d1:	eb e9                	jmp    8bc <malloc_wf+0xcc>
