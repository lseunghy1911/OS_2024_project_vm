
_echo:     file format elf32-i386


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
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	56                   	push   %esi
   e:	53                   	push   %ebx
   f:	51                   	push   %ecx
  10:	83 ec 0c             	sub    $0xc,%esp
  13:	8b 01                	mov    (%ecx),%eax
  15:	8b 51 04             	mov    0x4(%ecx),%edx
  int i;

  for(i = 1; i < argc; i++)
  18:	83 f8 01             	cmp    $0x1,%eax
  1b:	7e 47                	jle    64 <main+0x64>
  1d:	8d 5a 04             	lea    0x4(%edx),%ebx
  20:	8d 34 82             	lea    (%edx,%eax,4),%esi
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  23:	83 c3 04             	add    $0x4,%ebx
  26:	8b 43 fc             	mov    -0x4(%ebx),%eax
  29:	39 f3                	cmp    %esi,%ebx
  2b:	74 22                	je     4f <main+0x4f>
  2d:	8d 76 00             	lea    0x0(%esi),%esi
  30:	68 17 09 00 00       	push   $0x917
  35:	83 c3 04             	add    $0x4,%ebx
  38:	50                   	push   %eax
  39:	68 e4 08 00 00       	push   $0x8e4
  3e:	6a 01                	push   $0x1
  40:	e8 db 03 00 00       	call   420 <printf>
  for(i = 1; i < argc; i++)
  45:	8b 43 fc             	mov    -0x4(%ebx),%eax
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  48:	83 c4 10             	add    $0x10,%esp
  4b:	39 f3                	cmp    %esi,%ebx
  4d:	75 e1                	jne    30 <main+0x30>
  4f:	68 10 09 00 00       	push   $0x910
  54:	50                   	push   %eax
  55:	68 e4 08 00 00       	push   $0x8e4
  5a:	6a 01                	push   $0x1
  5c:	e8 bf 03 00 00       	call   420 <printf>
  61:	83 c4 10             	add    $0x10,%esp
  exit();
  64:	e8 5a 02 00 00       	call   2c3 <exit>
  69:	66 90                	xchg   %ax,%ax
  6b:	66 90                	xchg   %ax,%ax
  6d:	66 90                	xchg   %ax,%ax
  6f:	90                   	nop

00000070 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  70:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  71:	31 c0                	xor    %eax,%eax
{
  73:	89 e5                	mov    %esp,%ebp
  75:	53                   	push   %ebx
  76:	8b 4d 08             	mov    0x8(%ebp),%ecx
  79:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  80:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  84:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  87:	83 c0 01             	add    $0x1,%eax
  8a:	84 d2                	test   %dl,%dl
  8c:	75 f2                	jne    80 <strcpy+0x10>
    ;
  return os;
}
  8e:	89 c8                	mov    %ecx,%eax
  90:	5b                   	pop    %ebx
  91:	5d                   	pop    %ebp
  92:	c3                   	ret    
  93:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000000a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	53                   	push   %ebx
  a4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  a7:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  aa:	0f b6 01             	movzbl (%ecx),%eax
  ad:	0f b6 1a             	movzbl (%edx),%ebx
  b0:	84 c0                	test   %al,%al
  b2:	75 1d                	jne    d1 <strcmp+0x31>
  b4:	eb 2a                	jmp    e0 <strcmp+0x40>
  b6:	8d 76 00             	lea    0x0(%esi),%esi
  b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  c0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
  c4:	83 c1 01             	add    $0x1,%ecx
  c7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  ca:	0f b6 1a             	movzbl (%edx),%ebx
  cd:	84 c0                	test   %al,%al
  cf:	74 0f                	je     e0 <strcmp+0x40>
  d1:	38 d8                	cmp    %bl,%al
  d3:	74 eb                	je     c0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
  d5:	29 d8                	sub    %ebx,%eax
}
  d7:	5b                   	pop    %ebx
  d8:	5d                   	pop    %ebp
  d9:	c3                   	ret    
  da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  e0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
  e2:	29 d8                	sub    %ebx,%eax
}
  e4:	5b                   	pop    %ebx
  e5:	5d                   	pop    %ebp
  e6:	c3                   	ret    
  e7:	89 f6                	mov    %esi,%esi
  e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000000f0 <strlen>:

uint
strlen(const char *s)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
  f6:	80 3a 00             	cmpb   $0x0,(%edx)
  f9:	74 15                	je     110 <strlen+0x20>
  fb:	31 c0                	xor    %eax,%eax
  fd:	8d 76 00             	lea    0x0(%esi),%esi
 100:	83 c0 01             	add    $0x1,%eax
 103:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 107:	89 c1                	mov    %eax,%ecx
 109:	75 f5                	jne    100 <strlen+0x10>
    ;
  return n;
}
 10b:	89 c8                	mov    %ecx,%eax
 10d:	5d                   	pop    %ebp
 10e:	c3                   	ret    
 10f:	90                   	nop
  for(n = 0; s[n]; n++)
 110:	31 c9                	xor    %ecx,%ecx
}
 112:	5d                   	pop    %ebp
 113:	89 c8                	mov    %ecx,%eax
 115:	c3                   	ret    
 116:	8d 76 00             	lea    0x0(%esi),%esi
 119:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000120 <memset>:

void*
memset(void *dst, int c, uint n)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	57                   	push   %edi
 124:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 127:	8b 4d 10             	mov    0x10(%ebp),%ecx
 12a:	8b 45 0c             	mov    0xc(%ebp),%eax
 12d:	89 d7                	mov    %edx,%edi
 12f:	fc                   	cld    
 130:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 132:	89 d0                	mov    %edx,%eax
 134:	5f                   	pop    %edi
 135:	5d                   	pop    %ebp
 136:	c3                   	ret    
 137:	89 f6                	mov    %esi,%esi
 139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000140 <strchr>:

char*
strchr(const char *s, char c)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	8b 45 08             	mov    0x8(%ebp),%eax
 146:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 14a:	0f b6 10             	movzbl (%eax),%edx
 14d:	84 d2                	test   %dl,%dl
 14f:	75 12                	jne    163 <strchr+0x23>
 151:	eb 1d                	jmp    170 <strchr+0x30>
 153:	90                   	nop
 154:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 158:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 15c:	83 c0 01             	add    $0x1,%eax
 15f:	84 d2                	test   %dl,%dl
 161:	74 0d                	je     170 <strchr+0x30>
    if(*s == c)
 163:	38 d1                	cmp    %dl,%cl
 165:	75 f1                	jne    158 <strchr+0x18>
      return (char*)s;
  return 0;
}
 167:	5d                   	pop    %ebp
 168:	c3                   	ret    
 169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 170:	31 c0                	xor    %eax,%eax
}
 172:	5d                   	pop    %ebp
 173:	c3                   	ret    
 174:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 17a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000180 <gets>:

char*
gets(char *buf, int max)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	57                   	push   %edi
 184:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 185:	31 f6                	xor    %esi,%esi
{
 187:	53                   	push   %ebx
 188:	89 f3                	mov    %esi,%ebx
 18a:	83 ec 1c             	sub    $0x1c,%esp
 18d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 190:	eb 2f                	jmp    1c1 <gets+0x41>
 192:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 198:	83 ec 04             	sub    $0x4,%esp
 19b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 19e:	6a 01                	push   $0x1
 1a0:	50                   	push   %eax
 1a1:	6a 00                	push   $0x0
 1a3:	e8 33 01 00 00       	call   2db <read>
    if(cc < 1)
 1a8:	83 c4 10             	add    $0x10,%esp
 1ab:	85 c0                	test   %eax,%eax
 1ad:	7e 1c                	jle    1cb <gets+0x4b>
      break;
    buf[i++] = c;
 1af:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1b3:	83 c7 01             	add    $0x1,%edi
 1b6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 1b9:	3c 0a                	cmp    $0xa,%al
 1bb:	74 23                	je     1e0 <gets+0x60>
 1bd:	3c 0d                	cmp    $0xd,%al
 1bf:	74 1f                	je     1e0 <gets+0x60>
  for(i=0; i+1 < max; ){
 1c1:	83 c3 01             	add    $0x1,%ebx
 1c4:	89 fe                	mov    %edi,%esi
 1c6:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1c9:	7c cd                	jl     198 <gets+0x18>
 1cb:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 1cd:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 1d0:	c6 03 00             	movb   $0x0,(%ebx)
}
 1d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1d6:	5b                   	pop    %ebx
 1d7:	5e                   	pop    %esi
 1d8:	5f                   	pop    %edi
 1d9:	5d                   	pop    %ebp
 1da:	c3                   	ret    
 1db:	90                   	nop
 1dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1e0:	8b 75 08             	mov    0x8(%ebp),%esi
 1e3:	8b 45 08             	mov    0x8(%ebp),%eax
 1e6:	01 de                	add    %ebx,%esi
 1e8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 1ea:	c6 03 00             	movb   $0x0,(%ebx)
}
 1ed:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1f0:	5b                   	pop    %ebx
 1f1:	5e                   	pop    %esi
 1f2:	5f                   	pop    %edi
 1f3:	5d                   	pop    %ebp
 1f4:	c3                   	ret    
 1f5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000200 <stat>:

int
stat(const char *n, struct stat *st)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	56                   	push   %esi
 204:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 205:	83 ec 08             	sub    $0x8,%esp
 208:	6a 00                	push   $0x0
 20a:	ff 75 08             	pushl  0x8(%ebp)
 20d:	e8 f1 00 00 00       	call   303 <open>
  if(fd < 0)
 212:	83 c4 10             	add    $0x10,%esp
 215:	85 c0                	test   %eax,%eax
 217:	78 27                	js     240 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 219:	83 ec 08             	sub    $0x8,%esp
 21c:	ff 75 0c             	pushl  0xc(%ebp)
 21f:	89 c3                	mov    %eax,%ebx
 221:	50                   	push   %eax
 222:	e8 f4 00 00 00       	call   31b <fstat>
  close(fd);
 227:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 22a:	89 c6                	mov    %eax,%esi
  close(fd);
 22c:	e8 ba 00 00 00       	call   2eb <close>
  return r;
 231:	83 c4 10             	add    $0x10,%esp
}
 234:	8d 65 f8             	lea    -0x8(%ebp),%esp
 237:	89 f0                	mov    %esi,%eax
 239:	5b                   	pop    %ebx
 23a:	5e                   	pop    %esi
 23b:	5d                   	pop    %ebp
 23c:	c3                   	ret    
 23d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 240:	be ff ff ff ff       	mov    $0xffffffff,%esi
 245:	eb ed                	jmp    234 <stat+0x34>
 247:	89 f6                	mov    %esi,%esi
 249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000250 <atoi>:

int
atoi(const char *s)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	53                   	push   %ebx
 254:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 257:	0f be 02             	movsbl (%edx),%eax
 25a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 25d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 260:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 265:	77 1e                	ja     285 <atoi+0x35>
 267:	89 f6                	mov    %esi,%esi
 269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 270:	83 c2 01             	add    $0x1,%edx
 273:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 276:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 27a:	0f be 02             	movsbl (%edx),%eax
 27d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 280:	80 fb 09             	cmp    $0x9,%bl
 283:	76 eb                	jbe    270 <atoi+0x20>
  return n;
}
 285:	89 c8                	mov    %ecx,%eax
 287:	5b                   	pop    %ebx
 288:	5d                   	pop    %ebp
 289:	c3                   	ret    
 28a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000290 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	57                   	push   %edi
 294:	8b 45 10             	mov    0x10(%ebp),%eax
 297:	8b 55 08             	mov    0x8(%ebp),%edx
 29a:	56                   	push   %esi
 29b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 29e:	85 c0                	test   %eax,%eax
 2a0:	7e 13                	jle    2b5 <memmove+0x25>
 2a2:	01 d0                	add    %edx,%eax
  dst = vdst;
 2a4:	89 d7                	mov    %edx,%edi
 2a6:	8d 76 00             	lea    0x0(%esi),%esi
 2a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    *dst++ = *src++;
 2b0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2b1:	39 f8                	cmp    %edi,%eax
 2b3:	75 fb                	jne    2b0 <memmove+0x20>
  return vdst;
}
 2b5:	5e                   	pop    %esi
 2b6:	89 d0                	mov    %edx,%eax
 2b8:	5f                   	pop    %edi
 2b9:	5d                   	pop    %ebp
 2ba:	c3                   	ret    

000002bb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2bb:	b8 01 00 00 00       	mov    $0x1,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret    

000002c3 <exit>:
SYSCALL(exit)
 2c3:	b8 02 00 00 00       	mov    $0x2,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret    

000002cb <wait>:
SYSCALL(wait)
 2cb:	b8 03 00 00 00       	mov    $0x3,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <pipe>:
SYSCALL(pipe)
 2d3:	b8 04 00 00 00       	mov    $0x4,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <read>:
SYSCALL(read)
 2db:	b8 05 00 00 00       	mov    $0x5,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <write>:
SYSCALL(write)
 2e3:	b8 10 00 00 00       	mov    $0x10,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <close>:
SYSCALL(close)
 2eb:	b8 15 00 00 00       	mov    $0x15,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <kill>:
SYSCALL(kill)
 2f3:	b8 06 00 00 00       	mov    $0x6,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <exec>:
SYSCALL(exec)
 2fb:	b8 07 00 00 00       	mov    $0x7,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <open>:
SYSCALL(open)
 303:	b8 0f 00 00 00       	mov    $0xf,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <mknod>:
SYSCALL(mknod)
 30b:	b8 11 00 00 00       	mov    $0x11,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <unlink>:
SYSCALL(unlink)
 313:	b8 12 00 00 00       	mov    $0x12,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <fstat>:
SYSCALL(fstat)
 31b:	b8 08 00 00 00       	mov    $0x8,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <link>:
SYSCALL(link)
 323:	b8 13 00 00 00       	mov    $0x13,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <mkdir>:
SYSCALL(mkdir)
 32b:	b8 14 00 00 00       	mov    $0x14,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <chdir>:
SYSCALL(chdir)
 333:	b8 09 00 00 00       	mov    $0x9,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <dup>:
SYSCALL(dup)
 33b:	b8 0a 00 00 00       	mov    $0xa,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <getpid>:
SYSCALL(getpid)
 343:	b8 0b 00 00 00       	mov    $0xb,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <sbrk>:
SYSCALL(sbrk)
 34b:	b8 0c 00 00 00       	mov    $0xc,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <sleep>:
SYSCALL(sleep)
 353:	b8 0d 00 00 00       	mov    $0xd,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret    

0000035b <uptime>:
SYSCALL(uptime)
 35b:	b8 0e 00 00 00       	mov    $0xe,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret    

00000363 <walkpt>:
SYSCALL(walkpt)
 363:	b8 16 00 00 00       	mov    $0x16,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret    
 36b:	66 90                	xchg   %ax,%ax
 36d:	66 90                	xchg   %ax,%ax
 36f:	90                   	nop

00000370 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	57                   	push   %edi
 374:	56                   	push   %esi
 375:	53                   	push   %ebx
 376:	83 ec 3c             	sub    $0x3c,%esp
 379:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 37c:	89 d1                	mov    %edx,%ecx
{
 37e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 381:	85 d2                	test   %edx,%edx
 383:	0f 89 7f 00 00 00    	jns    408 <printint+0x98>
 389:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 38d:	74 79                	je     408 <printint+0x98>
    neg = 1;
 38f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 396:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 398:	31 db                	xor    %ebx,%ebx
 39a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 39d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 3a0:	89 c8                	mov    %ecx,%eax
 3a2:	31 d2                	xor    %edx,%edx
 3a4:	89 cf                	mov    %ecx,%edi
 3a6:	f7 75 c4             	divl   -0x3c(%ebp)
 3a9:	0f b6 92 f0 08 00 00 	movzbl 0x8f0(%edx),%edx
 3b0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 3b3:	89 d8                	mov    %ebx,%eax
 3b5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 3b8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 3bb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 3be:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 3c1:	76 dd                	jbe    3a0 <printint+0x30>
  if(neg)
 3c3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 3c6:	85 c9                	test   %ecx,%ecx
 3c8:	74 0c                	je     3d6 <printint+0x66>
    buf[i++] = '-';
 3ca:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 3cf:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 3d1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 3d6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 3d9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 3dd:	eb 07                	jmp    3e6 <printint+0x76>
 3df:	90                   	nop
 3e0:	0f b6 13             	movzbl (%ebx),%edx
 3e3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 3e6:	83 ec 04             	sub    $0x4,%esp
 3e9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 3ec:	6a 01                	push   $0x1
 3ee:	56                   	push   %esi
 3ef:	57                   	push   %edi
 3f0:	e8 ee fe ff ff       	call   2e3 <write>
  while(--i >= 0)
 3f5:	83 c4 10             	add    $0x10,%esp
 3f8:	39 de                	cmp    %ebx,%esi
 3fa:	75 e4                	jne    3e0 <printint+0x70>
    putc(fd, buf[i]);
}
 3fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3ff:	5b                   	pop    %ebx
 400:	5e                   	pop    %esi
 401:	5f                   	pop    %edi
 402:	5d                   	pop    %ebp
 403:	c3                   	ret    
 404:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 408:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 40f:	eb 87                	jmp    398 <printint+0x28>
 411:	eb 0d                	jmp    420 <printf>
 413:	90                   	nop
 414:	90                   	nop
 415:	90                   	nop
 416:	90                   	nop
 417:	90                   	nop
 418:	90                   	nop
 419:	90                   	nop
 41a:	90                   	nop
 41b:	90                   	nop
 41c:	90                   	nop
 41d:	90                   	nop
 41e:	90                   	nop
 41f:	90                   	nop

00000420 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	57                   	push   %edi
 424:	56                   	push   %esi
 425:	53                   	push   %ebx
 426:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 429:	8b 75 0c             	mov    0xc(%ebp),%esi
 42c:	0f b6 1e             	movzbl (%esi),%ebx
 42f:	84 db                	test   %bl,%bl
 431:	0f 84 b8 00 00 00    	je     4ef <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 437:	8d 45 10             	lea    0x10(%ebp),%eax
 43a:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 43d:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 440:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 442:	89 45 d0             	mov    %eax,-0x30(%ebp)
 445:	eb 37                	jmp    47e <printf+0x5e>
 447:	89 f6                	mov    %esi,%esi
 449:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 450:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 453:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 458:	83 f8 25             	cmp    $0x25,%eax
 45b:	74 17                	je     474 <printf+0x54>
  write(fd, &c, 1);
 45d:	83 ec 04             	sub    $0x4,%esp
 460:	88 5d e7             	mov    %bl,-0x19(%ebp)
 463:	6a 01                	push   $0x1
 465:	57                   	push   %edi
 466:	ff 75 08             	pushl  0x8(%ebp)
 469:	e8 75 fe ff ff       	call   2e3 <write>
 46e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 471:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 474:	0f b6 1e             	movzbl (%esi),%ebx
 477:	83 c6 01             	add    $0x1,%esi
 47a:	84 db                	test   %bl,%bl
 47c:	74 71                	je     4ef <printf+0xcf>
    c = fmt[i] & 0xff;
 47e:	0f be cb             	movsbl %bl,%ecx
 481:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 484:	85 d2                	test   %edx,%edx
 486:	74 c8                	je     450 <printf+0x30>
      }
    } else if(state == '%'){
 488:	83 fa 25             	cmp    $0x25,%edx
 48b:	75 e7                	jne    474 <printf+0x54>
      if(c == 'd'){
 48d:	83 f8 64             	cmp    $0x64,%eax
 490:	0f 84 9a 00 00 00    	je     530 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 496:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 49c:	83 f9 70             	cmp    $0x70,%ecx
 49f:	74 5f                	je     500 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 4a1:	83 f8 73             	cmp    $0x73,%eax
 4a4:	0f 84 d6 00 00 00    	je     580 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 4aa:	83 f8 63             	cmp    $0x63,%eax
 4ad:	0f 84 8d 00 00 00    	je     540 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 4b3:	83 f8 25             	cmp    $0x25,%eax
 4b6:	0f 84 b4 00 00 00    	je     570 <printf+0x150>
  write(fd, &c, 1);
 4bc:	83 ec 04             	sub    $0x4,%esp
 4bf:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 4c3:	6a 01                	push   $0x1
 4c5:	57                   	push   %edi
 4c6:	ff 75 08             	pushl  0x8(%ebp)
 4c9:	e8 15 fe ff ff       	call   2e3 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 4ce:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 4d1:	83 c4 0c             	add    $0xc,%esp
 4d4:	6a 01                	push   $0x1
 4d6:	83 c6 01             	add    $0x1,%esi
 4d9:	57                   	push   %edi
 4da:	ff 75 08             	pushl  0x8(%ebp)
 4dd:	e8 01 fe ff ff       	call   2e3 <write>
  for(i = 0; fmt[i]; i++){
 4e2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 4e6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 4e9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 4eb:	84 db                	test   %bl,%bl
 4ed:	75 8f                	jne    47e <printf+0x5e>
    }
  }
}
 4ef:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4f2:	5b                   	pop    %ebx
 4f3:	5e                   	pop    %esi
 4f4:	5f                   	pop    %edi
 4f5:	5d                   	pop    %ebp
 4f6:	c3                   	ret    
 4f7:	89 f6                	mov    %esi,%esi
 4f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        printint(fd, *ap, 16, 0);
 500:	83 ec 0c             	sub    $0xc,%esp
 503:	b9 10 00 00 00       	mov    $0x10,%ecx
 508:	6a 00                	push   $0x0
 50a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 50d:	8b 45 08             	mov    0x8(%ebp),%eax
 510:	8b 13                	mov    (%ebx),%edx
 512:	e8 59 fe ff ff       	call   370 <printint>
        ap++;
 517:	89 d8                	mov    %ebx,%eax
 519:	83 c4 10             	add    $0x10,%esp
      state = 0;
 51c:	31 d2                	xor    %edx,%edx
        ap++;
 51e:	83 c0 04             	add    $0x4,%eax
 521:	89 45 d0             	mov    %eax,-0x30(%ebp)
 524:	e9 4b ff ff ff       	jmp    474 <printf+0x54>
 529:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 530:	83 ec 0c             	sub    $0xc,%esp
 533:	b9 0a 00 00 00       	mov    $0xa,%ecx
 538:	6a 01                	push   $0x1
 53a:	eb ce                	jmp    50a <printf+0xea>
 53c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 540:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 543:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 546:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 548:	6a 01                	push   $0x1
        ap++;
 54a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 54d:	57                   	push   %edi
 54e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 551:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 554:	e8 8a fd ff ff       	call   2e3 <write>
        ap++;
 559:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 55c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 55f:	31 d2                	xor    %edx,%edx
 561:	e9 0e ff ff ff       	jmp    474 <printf+0x54>
 566:	8d 76 00             	lea    0x0(%esi),%esi
 569:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        putc(fd, c);
 570:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 573:	83 ec 04             	sub    $0x4,%esp
 576:	e9 59 ff ff ff       	jmp    4d4 <printf+0xb4>
 57b:	90                   	nop
 57c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 580:	8b 45 d0             	mov    -0x30(%ebp),%eax
 583:	8b 18                	mov    (%eax),%ebx
        ap++;
 585:	83 c0 04             	add    $0x4,%eax
 588:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 58b:	85 db                	test   %ebx,%ebx
 58d:	74 17                	je     5a6 <printf+0x186>
        while(*s != 0){
 58f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 592:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 594:	84 c0                	test   %al,%al
 596:	0f 84 d8 fe ff ff    	je     474 <printf+0x54>
 59c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 59f:	89 de                	mov    %ebx,%esi
 5a1:	8b 5d 08             	mov    0x8(%ebp),%ebx
 5a4:	eb 1a                	jmp    5c0 <printf+0x1a0>
          s = "(null)";
 5a6:	bb e9 08 00 00       	mov    $0x8e9,%ebx
        while(*s != 0){
 5ab:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 5ae:	b8 28 00 00 00       	mov    $0x28,%eax
 5b3:	89 de                	mov    %ebx,%esi
 5b5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 5b8:	90                   	nop
 5b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 5c0:	83 ec 04             	sub    $0x4,%esp
          s++;
 5c3:	83 c6 01             	add    $0x1,%esi
 5c6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 5c9:	6a 01                	push   $0x1
 5cb:	57                   	push   %edi
 5cc:	53                   	push   %ebx
 5cd:	e8 11 fd ff ff       	call   2e3 <write>
        while(*s != 0){
 5d2:	0f b6 06             	movzbl (%esi),%eax
 5d5:	83 c4 10             	add    $0x10,%esp
 5d8:	84 c0                	test   %al,%al
 5da:	75 e4                	jne    5c0 <printf+0x1a0>
 5dc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 5df:	31 d2                	xor    %edx,%edx
 5e1:	e9 8e fe ff ff       	jmp    474 <printf+0x54>
 5e6:	66 90                	xchg   %ax,%ax
 5e8:	66 90                	xchg   %ax,%ax
 5ea:	66 90                	xchg   %ax,%ax
 5ec:	66 90                	xchg   %ax,%ax
 5ee:	66 90                	xchg   %ax,%ax

000005f0 <print_free_list>:
static Header base;
static Header *freep;

// print free list status
void
print_free_list(){
 5f0:	55                   	push   %ebp
 5f1:	89 e5                	mov    %esp,%ebp
 5f3:	53                   	push   %ebx
 5f4:	83 ec 0c             	sub    $0xc,%esp
  Header* p;
  printf(1, "Header -> ");
 5f7:	68 01 09 00 00       	push   $0x901
 5fc:	6a 01                	push   $0x1
 5fe:	e8 1d fe ff ff       	call   420 <printf>
  if(freep == 0){ 
 603:	a1 40 0c 00 00       	mov    0xc40,%eax
 608:	83 c4 10             	add    $0x10,%esp
 60b:	85 c0                	test   %eax,%eax
 60d:	74 30                	je     63f <print_free_list+0x4f>
    printf(1, "NULL\n");
    return;
  }
  for(p = base.s.ptr; p != &base; p = p->s.ptr){
 60f:	8b 1d 44 0c 00 00    	mov    0xc44,%ebx
 615:	81 fb 44 0c 00 00    	cmp    $0xc44,%ebx
 61b:	74 22                	je     63f <print_free_list+0x4f>
 61d:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "%d -> ", p->s.size);
 620:	83 ec 04             	sub    $0x4,%esp
 623:	ff 73 04             	pushl  0x4(%ebx)
 626:	68 12 09 00 00       	push   $0x912
 62b:	6a 01                	push   $0x1
 62d:	e8 ee fd ff ff       	call   420 <printf>
  for(p = base.s.ptr; p != &base; p = p->s.ptr){
 632:	8b 1b                	mov    (%ebx),%ebx
 634:	83 c4 10             	add    $0x10,%esp
 637:	81 fb 44 0c 00 00    	cmp    $0xc44,%ebx
 63d:	75 e1                	jne    620 <print_free_list+0x30>
    printf(1, "NULL\n");
 63f:	83 ec 08             	sub    $0x8,%esp
 642:	68 0c 09 00 00       	push   $0x90c
 647:	6a 01                	push   $0x1
 649:	e8 d2 fd ff ff       	call   420 <printf>
  }
  printf(1, "NULL\n");
}
 64e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 651:	c9                   	leave  
 652:	c3                   	ret    
 653:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 659:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000660 <free>:

void
free(void *ap)
{
 660:	55                   	push   %ebp
  Header *bp, *p;
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 661:	a1 40 0c 00 00       	mov    0xc40,%eax
{
 666:	89 e5                	mov    %esp,%ebp
 668:	57                   	push   %edi
 669:	56                   	push   %esi
 66a:	53                   	push   %ebx
 66b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 66e:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 670:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 673:	39 c8                	cmp    %ecx,%eax
 675:	73 19                	jae    690 <free+0x30>
 677:	89 f6                	mov    %esi,%esi
 679:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 680:	39 d1                	cmp    %edx,%ecx
 682:	72 14                	jb     698 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 684:	39 d0                	cmp    %edx,%eax
 686:	73 10                	jae    698 <free+0x38>
{
 688:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 68a:	8b 10                	mov    (%eax),%edx
 68c:	39 c8                	cmp    %ecx,%eax
 68e:	72 f0                	jb     680 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 690:	39 d0                	cmp    %edx,%eax
 692:	72 f4                	jb     688 <free+0x28>
 694:	39 d1                	cmp    %edx,%ecx
 696:	73 f0                	jae    688 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 698:	8b 73 fc             	mov    -0x4(%ebx),%esi
 69b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 69e:	39 fa                	cmp    %edi,%edx
 6a0:	74 1e                	je     6c0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6a2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6a5:	8b 50 04             	mov    0x4(%eax),%edx
 6a8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6ab:	39 f1                	cmp    %esi,%ecx
 6ad:	74 28                	je     6d7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6af:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 6b1:	5b                   	pop    %ebx
  freep = p;
 6b2:	a3 40 0c 00 00       	mov    %eax,0xc40
}
 6b7:	5e                   	pop    %esi
 6b8:	5f                   	pop    %edi
 6b9:	5d                   	pop    %ebp
 6ba:	c3                   	ret    
 6bb:	90                   	nop
 6bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 6c0:	03 72 04             	add    0x4(%edx),%esi
 6c3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6c6:	8b 10                	mov    (%eax),%edx
 6c8:	8b 12                	mov    (%edx),%edx
 6ca:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6cd:	8b 50 04             	mov    0x4(%eax),%edx
 6d0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6d3:	39 f1                	cmp    %esi,%ecx
 6d5:	75 d8                	jne    6af <free+0x4f>
    p->s.size += bp->s.size;
 6d7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 6da:	a3 40 0c 00 00       	mov    %eax,0xc40
    p->s.size += bp->s.size;
 6df:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6e2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6e5:	89 10                	mov    %edx,(%eax)
}
 6e7:	5b                   	pop    %ebx
 6e8:	5e                   	pop    %esi
 6e9:	5f                   	pop    %edi
 6ea:	5d                   	pop    %ebp
 6eb:	c3                   	ret    
 6ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000006f0 <morecore>:

static Header*
morecore(uint nu)
{
 6f0:	55                   	push   %ebp
 6f1:	89 e5                	mov    %esp,%ebp
 6f3:	53                   	push   %ebx
 6f4:	bb 00 10 00 00       	mov    $0x1000,%ebx
 6f9:	83 ec 10             	sub    $0x10,%esp
 6fc:	3d 00 10 00 00       	cmp    $0x1000,%eax
 701:	0f 43 d8             	cmovae %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 704:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 70b:	50                   	push   %eax
 70c:	e8 3a fc ff ff       	call   34b <sbrk>
  if(p == (char*)-1)
 711:	83 c4 10             	add    $0x10,%esp
 714:	83 f8 ff             	cmp    $0xffffffff,%eax
 717:	74 1f                	je     738 <morecore+0x48>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 719:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 71c:	83 ec 0c             	sub    $0xc,%esp
 71f:	83 c0 08             	add    $0x8,%eax
 722:	50                   	push   %eax
 723:	e8 38 ff ff ff       	call   660 <free>
  return freep;
 728:	a1 40 0c 00 00       	mov    0xc40,%eax
}
 72d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  return freep;
 730:	83 c4 10             	add    $0x10,%esp
}
 733:	c9                   	leave  
 734:	c3                   	ret    
 735:	8d 76 00             	lea    0x0(%esi),%esi
 738:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return 0;
 73b:	31 c0                	xor    %eax,%eax
}
 73d:	c9                   	leave  
 73e:	c3                   	ret    
 73f:	90                   	nop

00000740 <malloc>:

void*
malloc(uint nbytes)
{
 740:	55                   	push   %ebp
  Header *p, *prevp;
  uint nunits;
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 741:	8b 0d 40 0c 00 00    	mov    0xc40,%ecx
{
 747:	89 e5                	mov    %esp,%ebp
 749:	56                   	push   %esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 74a:	8b 45 08             	mov    0x8(%ebp),%eax
{
 74d:	53                   	push   %ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 74e:	8d 58 07             	lea    0x7(%eax),%ebx
 751:	c1 eb 03             	shr    $0x3,%ebx
 754:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 757:	85 c9                	test   %ecx,%ecx
 759:	74 65                	je     7c0 <malloc+0x80>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 75b:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 75d:	8b 50 04             	mov    0x4(%eax),%edx
 760:	39 d3                	cmp    %edx,%ebx
 762:	77 1d                	ja     781 <malloc+0x41>
 764:	eb 2e                	jmp    794 <malloc+0x54>
 766:	8d 76 00             	lea    0x0(%esi),%esi
 769:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 770:	8b 30                	mov    (%eax),%esi
    if(p->s.size >= nunits){
 772:	8b 56 04             	mov    0x4(%esi),%edx
 775:	39 da                	cmp    %ebx,%edx
 777:	73 27                	jae    7a0 <malloc+0x60>
 779:	8b 0d 40 0c 00 00    	mov    0xc40,%ecx
 77f:	89 f0                	mov    %esi,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 781:	39 c1                	cmp    %eax,%ecx
 783:	75 eb                	jne    770 <malloc+0x30>
      if((p = morecore(nunits)) == 0)
 785:	89 d8                	mov    %ebx,%eax
 787:	e8 64 ff ff ff       	call   6f0 <morecore>
 78c:	85 c0                	test   %eax,%eax
 78e:	75 e0                	jne    770 <malloc+0x30>
        return 0;
  }
}
 790:	5b                   	pop    %ebx
 791:	5e                   	pop    %esi
 792:	5d                   	pop    %ebp
 793:	c3                   	ret    
    if(p->s.size >= nunits){
 794:	89 c6                	mov    %eax,%esi
 796:	89 c8                	mov    %ecx,%eax
 798:	90                   	nop
 799:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 7a0:	39 d3                	cmp    %edx,%ebx
 7a2:	74 4c                	je     7f0 <malloc+0xb0>
        p->s.size -= nunits;
 7a4:	29 da                	sub    %ebx,%edx
 7a6:	89 56 04             	mov    %edx,0x4(%esi)
        p += p->s.size;
 7a9:	8d 34 d6             	lea    (%esi,%edx,8),%esi
        p->s.size = nunits;
 7ac:	89 5e 04             	mov    %ebx,0x4(%esi)
}
 7af:	5b                   	pop    %ebx
      freep = prevp;
 7b0:	a3 40 0c 00 00       	mov    %eax,0xc40
      return (void*)(p + 1);
 7b5:	8d 46 08             	lea    0x8(%esi),%eax
}
 7b8:	5e                   	pop    %esi
 7b9:	5d                   	pop    %ebp
 7ba:	c3                   	ret    
 7bb:	90                   	nop
 7bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 7c0:	c7 05 40 0c 00 00 44 	movl   $0xc44,0xc40
 7c7:	0c 00 00 
    base.s.size = 0;
 7ca:	b9 44 0c 00 00       	mov    $0xc44,%ecx
    base.s.ptr = freep = prevp = &base;
 7cf:	c7 05 44 0c 00 00 44 	movl   $0xc44,0xc44
 7d6:	0c 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7d9:	89 c8                	mov    %ecx,%eax
    base.s.size = 0;
 7db:	c7 05 48 0c 00 00 00 	movl   $0x0,0xc48
 7e2:	00 00 00 
    if(p->s.size >= nunits){
 7e5:	eb 9a                	jmp    781 <malloc+0x41>
 7e7:	89 f6                	mov    %esi,%esi
 7e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        prevp->s.ptr = p->s.ptr;
 7f0:	8b 16                	mov    (%esi),%edx
 7f2:	89 10                	mov    %edx,(%eax)
 7f4:	eb b9                	jmp    7af <malloc+0x6f>
 7f6:	8d 76 00             	lea    0x0(%esi),%esi
 7f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000800 <malloc_wf>:

// modify malloc to implement 'worst fit' strategy
void*
malloc_wf(uint nbytes)
{
 800:	55                   	push   %ebp
 801:	89 e5                	mov    %esp,%ebp
 803:	57                   	push   %edi
 804:	56                   	push   %esi
 805:	53                   	push   %ebx
 806:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp, *maxp, *maxprevp;
  uint nunits;
  uint max = 0;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 809:	8b 45 08             	mov    0x8(%ebp),%eax
 80c:	83 c0 07             	add    $0x7,%eax
 80f:	c1 e8 03             	shr    $0x3,%eax
 812:	83 c0 01             	add    $0x1,%eax
 815:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 818:	90                   	nop
 819:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  if((prevp = freep) == 0){
 820:	8b 1d 40 0c 00 00    	mov    0xc40,%ebx
 826:	85 db                	test   %ebx,%ebx
 828:	74 66                	je     890 <malloc_wf+0x90>
 82a:	8b 03                	mov    (%ebx),%eax
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }

  maxp = 0;
  maxprevp = 0;
 82c:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  if((prevp = freep) == 0){
 833:	89 df                	mov    %ebx,%edi
  uint max = 0;
 835:	31 f6                	xor    %esi,%esi
  maxp = 0;
 837:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
 83e:	8b 50 04             	mov    0x4(%eax),%edx
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 841:	eb 12                	jmp    855 <malloc_wf+0x55>
 843:	90                   	nop
 844:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p->s.size >= nunits && p->s.size > max){
      max = p->s.size;
      maxp = p;
      maxprevp = prevp;
    }
    if(p == freep)
 848:	39 d8                	cmp    %ebx,%eax
 84a:	74 24                	je     870 <malloc_wf+0x70>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 84c:	8b 08                	mov    (%eax),%ecx
    if(p->s.size >= nunits && p->s.size > max){
 84e:	89 c7                	mov    %eax,%edi
 850:	8b 51 04             	mov    0x4(%ecx),%edx
 853:	89 c8                	mov    %ecx,%eax
 855:	39 d6                	cmp    %edx,%esi
 857:	73 ef                	jae    848 <malloc_wf+0x48>
 859:	39 55 e4             	cmp    %edx,-0x1c(%ebp)
 85c:	77 ea                	ja     848 <malloc_wf+0x48>
    if(p == freep)
 85e:	39 d8                	cmp    %ebx,%eax
 860:	74 57                	je     8b9 <malloc_wf+0xb9>
 862:	89 7d dc             	mov    %edi,-0x24(%ebp)
 865:	89 d6                	mov    %edx,%esi
 867:	89 45 e0             	mov    %eax,-0x20(%ebp)
 86a:	eb e0                	jmp    84c <malloc_wf+0x4c>
 86c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      break;
  }

  if(maxp != 0){
 870:	8b 45 e0             	mov    -0x20(%ebp),%eax
 873:	85 c0                	test   %eax,%eax
 875:	75 39                	jne    8b0 <malloc_wf+0xb0>
      p->s.size = nunits;
    }
    freep = prevp;
    return (void*)(p + 1);
  } else {
    if((p = morecore(nunits)) == 0)
 877:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 87a:	e8 71 fe ff ff       	call   6f0 <morecore>
 87f:	85 c0                	test   %eax,%eax
 881:	75 9d                	jne    820 <malloc_wf+0x20>
      return 0;
    return malloc_wf(nbytes);
  }
 883:	83 c4 1c             	add    $0x1c,%esp
 886:	5b                   	pop    %ebx
 887:	5e                   	pop    %esi
 888:	5f                   	pop    %edi
 889:	5d                   	pop    %ebp
 88a:	c3                   	ret    
 88b:	90                   	nop
 88c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 890:	c7 05 40 0c 00 00 44 	movl   $0xc44,0xc40
 897:	0c 00 00 
 89a:	c7 05 44 0c 00 00 44 	movl   $0xc44,0xc44
 8a1:	0c 00 00 
    base.s.size = 0;
 8a4:	c7 05 48 0c 00 00 00 	movl   $0x0,0xc48
 8ab:	00 00 00 
  if(maxp != 0){
 8ae:	eb c7                	jmp    877 <malloc_wf+0x77>
 8b0:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 8b3:	8b 7d dc             	mov    -0x24(%ebp),%edi
 8b6:	8b 53 04             	mov    0x4(%ebx),%edx
    if(p->s.size == nunits){
 8b9:	39 55 e4             	cmp    %edx,-0x1c(%ebp)
 8bc:	74 1f                	je     8dd <malloc_wf+0xdd>
      p->s.size -= nunits;
 8be:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8c1:	29 c2                	sub    %eax,%edx
 8c3:	89 53 04             	mov    %edx,0x4(%ebx)
      p = p + p->s.size;
 8c6:	8d 1c d3             	lea    (%ebx,%edx,8),%ebx
      p->s.size = nunits;
 8c9:	89 43 04             	mov    %eax,0x4(%ebx)
    freep = prevp;
 8cc:	89 3d 40 0c 00 00    	mov    %edi,0xc40
 8d2:	83 c4 1c             	add    $0x1c,%esp
    return (void*)(p + 1);
 8d5:	8d 43 08             	lea    0x8(%ebx),%eax
 8d8:	5b                   	pop    %ebx
 8d9:	5e                   	pop    %esi
 8da:	5f                   	pop    %edi
 8db:	5d                   	pop    %ebp
 8dc:	c3                   	ret    
      prevp->s.ptr = p->s.ptr;
 8dd:	8b 03                	mov    (%ebx),%eax
 8df:	89 07                	mov    %eax,(%edi)
 8e1:	eb e9                	jmp    8cc <malloc_wf+0xcc>
