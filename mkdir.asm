
_mkdir:     file format elf32-i386


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
   d:	57                   	push   %edi
   e:	bf 01 00 00 00       	mov    $0x1,%edi
  13:	56                   	push   %esi
  14:	53                   	push   %ebx
  15:	51                   	push   %ecx
  16:	83 ec 08             	sub    $0x8,%esp
  19:	8b 59 04             	mov    0x4(%ecx),%ebx
  1c:	8b 31                	mov    (%ecx),%esi
  1e:	83 c3 04             	add    $0x4,%ebx
  int i;

  if(argc < 2){
  21:	83 fe 01             	cmp    $0x1,%esi
  24:	7e 3e                	jle    64 <main+0x64>
  26:	8d 76 00             	lea    0x0(%esi),%esi
  29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    printf(2, "Usage: mkdir files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
    if(mkdir(argv[i]) < 0){
  30:	83 ec 0c             	sub    $0xc,%esp
  33:	ff 33                	pushl  (%ebx)
  35:	e8 01 03 00 00       	call   33b <mkdir>
  3a:	83 c4 10             	add    $0x10,%esp
  3d:	85 c0                	test   %eax,%eax
  3f:	78 0f                	js     50 <main+0x50>
  for(i = 1; i < argc; i++){
  41:	83 c7 01             	add    $0x1,%edi
  44:	83 c3 04             	add    $0x4,%ebx
  47:	39 fe                	cmp    %edi,%esi
  49:	75 e5                	jne    30 <main+0x30>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
      break;
    }
  }

  exit();
  4b:	e8 83 02 00 00       	call   2d3 <exit>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
  50:	50                   	push   %eax
  51:	ff 33                	pushl  (%ebx)
  53:	68 0b 09 00 00       	push   $0x90b
  58:	6a 02                	push   $0x2
  5a:	e8 d1 03 00 00       	call   430 <printf>
      break;
  5f:	83 c4 10             	add    $0x10,%esp
  62:	eb e7                	jmp    4b <main+0x4b>
    printf(2, "Usage: mkdir files...\n");
  64:	52                   	push   %edx
  65:	52                   	push   %edx
  66:	68 f4 08 00 00       	push   $0x8f4
  6b:	6a 02                	push   $0x2
  6d:	e8 be 03 00 00       	call   430 <printf>
    exit();
  72:	e8 5c 02 00 00       	call   2d3 <exit>
  77:	66 90                	xchg   %ax,%ax
  79:	66 90                	xchg   %ax,%ax
  7b:	66 90                	xchg   %ax,%ax
  7d:	66 90                	xchg   %ax,%ax
  7f:	90                   	nop

00000080 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  80:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  81:	31 c0                	xor    %eax,%eax
{
  83:	89 e5                	mov    %esp,%ebp
  85:	53                   	push   %ebx
  86:	8b 4d 08             	mov    0x8(%ebp),%ecx
  89:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  90:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  94:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  97:	83 c0 01             	add    $0x1,%eax
  9a:	84 d2                	test   %dl,%dl
  9c:	75 f2                	jne    90 <strcpy+0x10>
    ;
  return os;
}
  9e:	89 c8                	mov    %ecx,%eax
  a0:	5b                   	pop    %ebx
  a1:	5d                   	pop    %ebp
  a2:	c3                   	ret    
  a3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000000b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	53                   	push   %ebx
  b4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  b7:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  ba:	0f b6 01             	movzbl (%ecx),%eax
  bd:	0f b6 1a             	movzbl (%edx),%ebx
  c0:	84 c0                	test   %al,%al
  c2:	75 1d                	jne    e1 <strcmp+0x31>
  c4:	eb 2a                	jmp    f0 <strcmp+0x40>
  c6:	8d 76 00             	lea    0x0(%esi),%esi
  c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  d0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
  d4:	83 c1 01             	add    $0x1,%ecx
  d7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  da:	0f b6 1a             	movzbl (%edx),%ebx
  dd:	84 c0                	test   %al,%al
  df:	74 0f                	je     f0 <strcmp+0x40>
  e1:	38 d8                	cmp    %bl,%al
  e3:	74 eb                	je     d0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
  e5:	29 d8                	sub    %ebx,%eax
}
  e7:	5b                   	pop    %ebx
  e8:	5d                   	pop    %ebp
  e9:	c3                   	ret    
  ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  f0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
  f2:	29 d8                	sub    %ebx,%eax
}
  f4:	5b                   	pop    %ebx
  f5:	5d                   	pop    %ebp
  f6:	c3                   	ret    
  f7:	89 f6                	mov    %esi,%esi
  f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000100 <strlen>:

uint
strlen(const char *s)
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 106:	80 3a 00             	cmpb   $0x0,(%edx)
 109:	74 15                	je     120 <strlen+0x20>
 10b:	31 c0                	xor    %eax,%eax
 10d:	8d 76 00             	lea    0x0(%esi),%esi
 110:	83 c0 01             	add    $0x1,%eax
 113:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 117:	89 c1                	mov    %eax,%ecx
 119:	75 f5                	jne    110 <strlen+0x10>
    ;
  return n;
}
 11b:	89 c8                	mov    %ecx,%eax
 11d:	5d                   	pop    %ebp
 11e:	c3                   	ret    
 11f:	90                   	nop
  for(n = 0; s[n]; n++)
 120:	31 c9                	xor    %ecx,%ecx
}
 122:	5d                   	pop    %ebp
 123:	89 c8                	mov    %ecx,%eax
 125:	c3                   	ret    
 126:	8d 76 00             	lea    0x0(%esi),%esi
 129:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000130 <memset>:

void*
memset(void *dst, int c, uint n)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	57                   	push   %edi
 134:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 137:	8b 4d 10             	mov    0x10(%ebp),%ecx
 13a:	8b 45 0c             	mov    0xc(%ebp),%eax
 13d:	89 d7                	mov    %edx,%edi
 13f:	fc                   	cld    
 140:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 142:	89 d0                	mov    %edx,%eax
 144:	5f                   	pop    %edi
 145:	5d                   	pop    %ebp
 146:	c3                   	ret    
 147:	89 f6                	mov    %esi,%esi
 149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000150 <strchr>:

char*
strchr(const char *s, char c)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	8b 45 08             	mov    0x8(%ebp),%eax
 156:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 15a:	0f b6 10             	movzbl (%eax),%edx
 15d:	84 d2                	test   %dl,%dl
 15f:	75 12                	jne    173 <strchr+0x23>
 161:	eb 1d                	jmp    180 <strchr+0x30>
 163:	90                   	nop
 164:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 168:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 16c:	83 c0 01             	add    $0x1,%eax
 16f:	84 d2                	test   %dl,%dl
 171:	74 0d                	je     180 <strchr+0x30>
    if(*s == c)
 173:	38 d1                	cmp    %dl,%cl
 175:	75 f1                	jne    168 <strchr+0x18>
      return (char*)s;
  return 0;
}
 177:	5d                   	pop    %ebp
 178:	c3                   	ret    
 179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 180:	31 c0                	xor    %eax,%eax
}
 182:	5d                   	pop    %ebp
 183:	c3                   	ret    
 184:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 18a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000190 <gets>:

char*
gets(char *buf, int max)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	57                   	push   %edi
 194:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 195:	31 f6                	xor    %esi,%esi
{
 197:	53                   	push   %ebx
 198:	89 f3                	mov    %esi,%ebx
 19a:	83 ec 1c             	sub    $0x1c,%esp
 19d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 1a0:	eb 2f                	jmp    1d1 <gets+0x41>
 1a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 1a8:	83 ec 04             	sub    $0x4,%esp
 1ab:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1ae:	6a 01                	push   $0x1
 1b0:	50                   	push   %eax
 1b1:	6a 00                	push   $0x0
 1b3:	e8 33 01 00 00       	call   2eb <read>
    if(cc < 1)
 1b8:	83 c4 10             	add    $0x10,%esp
 1bb:	85 c0                	test   %eax,%eax
 1bd:	7e 1c                	jle    1db <gets+0x4b>
      break;
    buf[i++] = c;
 1bf:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1c3:	83 c7 01             	add    $0x1,%edi
 1c6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 1c9:	3c 0a                	cmp    $0xa,%al
 1cb:	74 23                	je     1f0 <gets+0x60>
 1cd:	3c 0d                	cmp    $0xd,%al
 1cf:	74 1f                	je     1f0 <gets+0x60>
  for(i=0; i+1 < max; ){
 1d1:	83 c3 01             	add    $0x1,%ebx
 1d4:	89 fe                	mov    %edi,%esi
 1d6:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1d9:	7c cd                	jl     1a8 <gets+0x18>
 1db:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 1dd:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 1e0:	c6 03 00             	movb   $0x0,(%ebx)
}
 1e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1e6:	5b                   	pop    %ebx
 1e7:	5e                   	pop    %esi
 1e8:	5f                   	pop    %edi
 1e9:	5d                   	pop    %ebp
 1ea:	c3                   	ret    
 1eb:	90                   	nop
 1ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1f0:	8b 75 08             	mov    0x8(%ebp),%esi
 1f3:	8b 45 08             	mov    0x8(%ebp),%eax
 1f6:	01 de                	add    %ebx,%esi
 1f8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 1fa:	c6 03 00             	movb   $0x0,(%ebx)
}
 1fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 200:	5b                   	pop    %ebx
 201:	5e                   	pop    %esi
 202:	5f                   	pop    %edi
 203:	5d                   	pop    %ebp
 204:	c3                   	ret    
 205:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000210 <stat>:

int
stat(const char *n, struct stat *st)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	56                   	push   %esi
 214:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 215:	83 ec 08             	sub    $0x8,%esp
 218:	6a 00                	push   $0x0
 21a:	ff 75 08             	pushl  0x8(%ebp)
 21d:	e8 f1 00 00 00       	call   313 <open>
  if(fd < 0)
 222:	83 c4 10             	add    $0x10,%esp
 225:	85 c0                	test   %eax,%eax
 227:	78 27                	js     250 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 229:	83 ec 08             	sub    $0x8,%esp
 22c:	ff 75 0c             	pushl  0xc(%ebp)
 22f:	89 c3                	mov    %eax,%ebx
 231:	50                   	push   %eax
 232:	e8 f4 00 00 00       	call   32b <fstat>
  close(fd);
 237:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 23a:	89 c6                	mov    %eax,%esi
  close(fd);
 23c:	e8 ba 00 00 00       	call   2fb <close>
  return r;
 241:	83 c4 10             	add    $0x10,%esp
}
 244:	8d 65 f8             	lea    -0x8(%ebp),%esp
 247:	89 f0                	mov    %esi,%eax
 249:	5b                   	pop    %ebx
 24a:	5e                   	pop    %esi
 24b:	5d                   	pop    %ebp
 24c:	c3                   	ret    
 24d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 250:	be ff ff ff ff       	mov    $0xffffffff,%esi
 255:	eb ed                	jmp    244 <stat+0x34>
 257:	89 f6                	mov    %esi,%esi
 259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000260 <atoi>:

int
atoi(const char *s)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	53                   	push   %ebx
 264:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 267:	0f be 02             	movsbl (%edx),%eax
 26a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 26d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 270:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 275:	77 1e                	ja     295 <atoi+0x35>
 277:	89 f6                	mov    %esi,%esi
 279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 280:	83 c2 01             	add    $0x1,%edx
 283:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 286:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 28a:	0f be 02             	movsbl (%edx),%eax
 28d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 290:	80 fb 09             	cmp    $0x9,%bl
 293:	76 eb                	jbe    280 <atoi+0x20>
  return n;
}
 295:	89 c8                	mov    %ecx,%eax
 297:	5b                   	pop    %ebx
 298:	5d                   	pop    %ebp
 299:	c3                   	ret    
 29a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	57                   	push   %edi
 2a4:	8b 45 10             	mov    0x10(%ebp),%eax
 2a7:	8b 55 08             	mov    0x8(%ebp),%edx
 2aa:	56                   	push   %esi
 2ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2ae:	85 c0                	test   %eax,%eax
 2b0:	7e 13                	jle    2c5 <memmove+0x25>
 2b2:	01 d0                	add    %edx,%eax
  dst = vdst;
 2b4:	89 d7                	mov    %edx,%edi
 2b6:	8d 76 00             	lea    0x0(%esi),%esi
 2b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    *dst++ = *src++;
 2c0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2c1:	39 f8                	cmp    %edi,%eax
 2c3:	75 fb                	jne    2c0 <memmove+0x20>
  return vdst;
}
 2c5:	5e                   	pop    %esi
 2c6:	89 d0                	mov    %edx,%eax
 2c8:	5f                   	pop    %edi
 2c9:	5d                   	pop    %ebp
 2ca:	c3                   	ret    

000002cb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2cb:	b8 01 00 00 00       	mov    $0x1,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <exit>:
SYSCALL(exit)
 2d3:	b8 02 00 00 00       	mov    $0x2,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <wait>:
SYSCALL(wait)
 2db:	b8 03 00 00 00       	mov    $0x3,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <pipe>:
SYSCALL(pipe)
 2e3:	b8 04 00 00 00       	mov    $0x4,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <read>:
SYSCALL(read)
 2eb:	b8 05 00 00 00       	mov    $0x5,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <write>:
SYSCALL(write)
 2f3:	b8 10 00 00 00       	mov    $0x10,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <close>:
SYSCALL(close)
 2fb:	b8 15 00 00 00       	mov    $0x15,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <kill>:
SYSCALL(kill)
 303:	b8 06 00 00 00       	mov    $0x6,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <exec>:
SYSCALL(exec)
 30b:	b8 07 00 00 00       	mov    $0x7,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <open>:
SYSCALL(open)
 313:	b8 0f 00 00 00       	mov    $0xf,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <mknod>:
SYSCALL(mknod)
 31b:	b8 11 00 00 00       	mov    $0x11,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <unlink>:
SYSCALL(unlink)
 323:	b8 12 00 00 00       	mov    $0x12,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <fstat>:
SYSCALL(fstat)
 32b:	b8 08 00 00 00       	mov    $0x8,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <link>:
SYSCALL(link)
 333:	b8 13 00 00 00       	mov    $0x13,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <mkdir>:
SYSCALL(mkdir)
 33b:	b8 14 00 00 00       	mov    $0x14,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <chdir>:
SYSCALL(chdir)
 343:	b8 09 00 00 00       	mov    $0x9,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <dup>:
SYSCALL(dup)
 34b:	b8 0a 00 00 00       	mov    $0xa,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <getpid>:
SYSCALL(getpid)
 353:	b8 0b 00 00 00       	mov    $0xb,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret    

0000035b <sbrk>:
SYSCALL(sbrk)
 35b:	b8 0c 00 00 00       	mov    $0xc,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret    

00000363 <sleep>:
SYSCALL(sleep)
 363:	b8 0d 00 00 00       	mov    $0xd,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret    

0000036b <uptime>:
SYSCALL(uptime)
 36b:	b8 0e 00 00 00       	mov    $0xe,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret    

00000373 <walkpt>:
SYSCALL(walkpt)
 373:	b8 16 00 00 00       	mov    $0x16,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret    
 37b:	66 90                	xchg   %ax,%ax
 37d:	66 90                	xchg   %ax,%ax
 37f:	90                   	nop

00000380 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	57                   	push   %edi
 384:	56                   	push   %esi
 385:	53                   	push   %ebx
 386:	83 ec 3c             	sub    $0x3c,%esp
 389:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 38c:	89 d1                	mov    %edx,%ecx
{
 38e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 391:	85 d2                	test   %edx,%edx
 393:	0f 89 7f 00 00 00    	jns    418 <printint+0x98>
 399:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 39d:	74 79                	je     418 <printint+0x98>
    neg = 1;
 39f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 3a6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 3a8:	31 db                	xor    %ebx,%ebx
 3aa:	8d 75 d7             	lea    -0x29(%ebp),%esi
 3ad:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 3b0:	89 c8                	mov    %ecx,%eax
 3b2:	31 d2                	xor    %edx,%edx
 3b4:	89 cf                	mov    %ecx,%edi
 3b6:	f7 75 c4             	divl   -0x3c(%ebp)
 3b9:	0f b6 92 30 09 00 00 	movzbl 0x930(%edx),%edx
 3c0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 3c3:	89 d8                	mov    %ebx,%eax
 3c5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 3c8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 3cb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 3ce:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 3d1:	76 dd                	jbe    3b0 <printint+0x30>
  if(neg)
 3d3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 3d6:	85 c9                	test   %ecx,%ecx
 3d8:	74 0c                	je     3e6 <printint+0x66>
    buf[i++] = '-';
 3da:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 3df:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 3e1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 3e6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 3e9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 3ed:	eb 07                	jmp    3f6 <printint+0x76>
 3ef:	90                   	nop
 3f0:	0f b6 13             	movzbl (%ebx),%edx
 3f3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 3f6:	83 ec 04             	sub    $0x4,%esp
 3f9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 3fc:	6a 01                	push   $0x1
 3fe:	56                   	push   %esi
 3ff:	57                   	push   %edi
 400:	e8 ee fe ff ff       	call   2f3 <write>
  while(--i >= 0)
 405:	83 c4 10             	add    $0x10,%esp
 408:	39 de                	cmp    %ebx,%esi
 40a:	75 e4                	jne    3f0 <printint+0x70>
    putc(fd, buf[i]);
}
 40c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 40f:	5b                   	pop    %ebx
 410:	5e                   	pop    %esi
 411:	5f                   	pop    %edi
 412:	5d                   	pop    %ebp
 413:	c3                   	ret    
 414:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 418:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 41f:	eb 87                	jmp    3a8 <printint+0x28>
 421:	eb 0d                	jmp    430 <printf>
 423:	90                   	nop
 424:	90                   	nop
 425:	90                   	nop
 426:	90                   	nop
 427:	90                   	nop
 428:	90                   	nop
 429:	90                   	nop
 42a:	90                   	nop
 42b:	90                   	nop
 42c:	90                   	nop
 42d:	90                   	nop
 42e:	90                   	nop
 42f:	90                   	nop

00000430 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	57                   	push   %edi
 434:	56                   	push   %esi
 435:	53                   	push   %ebx
 436:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 439:	8b 75 0c             	mov    0xc(%ebp),%esi
 43c:	0f b6 1e             	movzbl (%esi),%ebx
 43f:	84 db                	test   %bl,%bl
 441:	0f 84 b8 00 00 00    	je     4ff <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 447:	8d 45 10             	lea    0x10(%ebp),%eax
 44a:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 44d:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 450:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 452:	89 45 d0             	mov    %eax,-0x30(%ebp)
 455:	eb 37                	jmp    48e <printf+0x5e>
 457:	89 f6                	mov    %esi,%esi
 459:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 460:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 463:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 468:	83 f8 25             	cmp    $0x25,%eax
 46b:	74 17                	je     484 <printf+0x54>
  write(fd, &c, 1);
 46d:	83 ec 04             	sub    $0x4,%esp
 470:	88 5d e7             	mov    %bl,-0x19(%ebp)
 473:	6a 01                	push   $0x1
 475:	57                   	push   %edi
 476:	ff 75 08             	pushl  0x8(%ebp)
 479:	e8 75 fe ff ff       	call   2f3 <write>
 47e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 481:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 484:	0f b6 1e             	movzbl (%esi),%ebx
 487:	83 c6 01             	add    $0x1,%esi
 48a:	84 db                	test   %bl,%bl
 48c:	74 71                	je     4ff <printf+0xcf>
    c = fmt[i] & 0xff;
 48e:	0f be cb             	movsbl %bl,%ecx
 491:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 494:	85 d2                	test   %edx,%edx
 496:	74 c8                	je     460 <printf+0x30>
      }
    } else if(state == '%'){
 498:	83 fa 25             	cmp    $0x25,%edx
 49b:	75 e7                	jne    484 <printf+0x54>
      if(c == 'd'){
 49d:	83 f8 64             	cmp    $0x64,%eax
 4a0:	0f 84 9a 00 00 00    	je     540 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 4a6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 4ac:	83 f9 70             	cmp    $0x70,%ecx
 4af:	74 5f                	je     510 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 4b1:	83 f8 73             	cmp    $0x73,%eax
 4b4:	0f 84 d6 00 00 00    	je     590 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 4ba:	83 f8 63             	cmp    $0x63,%eax
 4bd:	0f 84 8d 00 00 00    	je     550 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 4c3:	83 f8 25             	cmp    $0x25,%eax
 4c6:	0f 84 b4 00 00 00    	je     580 <printf+0x150>
  write(fd, &c, 1);
 4cc:	83 ec 04             	sub    $0x4,%esp
 4cf:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 4d3:	6a 01                	push   $0x1
 4d5:	57                   	push   %edi
 4d6:	ff 75 08             	pushl  0x8(%ebp)
 4d9:	e8 15 fe ff ff       	call   2f3 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 4de:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 4e1:	83 c4 0c             	add    $0xc,%esp
 4e4:	6a 01                	push   $0x1
 4e6:	83 c6 01             	add    $0x1,%esi
 4e9:	57                   	push   %edi
 4ea:	ff 75 08             	pushl  0x8(%ebp)
 4ed:	e8 01 fe ff ff       	call   2f3 <write>
  for(i = 0; fmt[i]; i++){
 4f2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 4f6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 4f9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 4fb:	84 db                	test   %bl,%bl
 4fd:	75 8f                	jne    48e <printf+0x5e>
    }
  }
}
 4ff:	8d 65 f4             	lea    -0xc(%ebp),%esp
 502:	5b                   	pop    %ebx
 503:	5e                   	pop    %esi
 504:	5f                   	pop    %edi
 505:	5d                   	pop    %ebp
 506:	c3                   	ret    
 507:	89 f6                	mov    %esi,%esi
 509:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        printint(fd, *ap, 16, 0);
 510:	83 ec 0c             	sub    $0xc,%esp
 513:	b9 10 00 00 00       	mov    $0x10,%ecx
 518:	6a 00                	push   $0x0
 51a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 51d:	8b 45 08             	mov    0x8(%ebp),%eax
 520:	8b 13                	mov    (%ebx),%edx
 522:	e8 59 fe ff ff       	call   380 <printint>
        ap++;
 527:	89 d8                	mov    %ebx,%eax
 529:	83 c4 10             	add    $0x10,%esp
      state = 0;
 52c:	31 d2                	xor    %edx,%edx
        ap++;
 52e:	83 c0 04             	add    $0x4,%eax
 531:	89 45 d0             	mov    %eax,-0x30(%ebp)
 534:	e9 4b ff ff ff       	jmp    484 <printf+0x54>
 539:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 540:	83 ec 0c             	sub    $0xc,%esp
 543:	b9 0a 00 00 00       	mov    $0xa,%ecx
 548:	6a 01                	push   $0x1
 54a:	eb ce                	jmp    51a <printf+0xea>
 54c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 550:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 553:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 556:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 558:	6a 01                	push   $0x1
        ap++;
 55a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 55d:	57                   	push   %edi
 55e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 561:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 564:	e8 8a fd ff ff       	call   2f3 <write>
        ap++;
 569:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 56c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 56f:	31 d2                	xor    %edx,%edx
 571:	e9 0e ff ff ff       	jmp    484 <printf+0x54>
 576:	8d 76 00             	lea    0x0(%esi),%esi
 579:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        putc(fd, c);
 580:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 583:	83 ec 04             	sub    $0x4,%esp
 586:	e9 59 ff ff ff       	jmp    4e4 <printf+0xb4>
 58b:	90                   	nop
 58c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 590:	8b 45 d0             	mov    -0x30(%ebp),%eax
 593:	8b 18                	mov    (%eax),%ebx
        ap++;
 595:	83 c0 04             	add    $0x4,%eax
 598:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 59b:	85 db                	test   %ebx,%ebx
 59d:	74 17                	je     5b6 <printf+0x186>
        while(*s != 0){
 59f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 5a2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 5a4:	84 c0                	test   %al,%al
 5a6:	0f 84 d8 fe ff ff    	je     484 <printf+0x54>
 5ac:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 5af:	89 de                	mov    %ebx,%esi
 5b1:	8b 5d 08             	mov    0x8(%ebp),%ebx
 5b4:	eb 1a                	jmp    5d0 <printf+0x1a0>
          s = "(null)";
 5b6:	bb 27 09 00 00       	mov    $0x927,%ebx
        while(*s != 0){
 5bb:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 5be:	b8 28 00 00 00       	mov    $0x28,%eax
 5c3:	89 de                	mov    %ebx,%esi
 5c5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 5c8:	90                   	nop
 5c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 5d0:	83 ec 04             	sub    $0x4,%esp
          s++;
 5d3:	83 c6 01             	add    $0x1,%esi
 5d6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 5d9:	6a 01                	push   $0x1
 5db:	57                   	push   %edi
 5dc:	53                   	push   %ebx
 5dd:	e8 11 fd ff ff       	call   2f3 <write>
        while(*s != 0){
 5e2:	0f b6 06             	movzbl (%esi),%eax
 5e5:	83 c4 10             	add    $0x10,%esp
 5e8:	84 c0                	test   %al,%al
 5ea:	75 e4                	jne    5d0 <printf+0x1a0>
 5ec:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 5ef:	31 d2                	xor    %edx,%edx
 5f1:	e9 8e fe ff ff       	jmp    484 <printf+0x54>
 5f6:	66 90                	xchg   %ax,%ax
 5f8:	66 90                	xchg   %ax,%ax
 5fa:	66 90                	xchg   %ax,%ax
 5fc:	66 90                	xchg   %ax,%ax
 5fe:	66 90                	xchg   %ax,%ax

00000600 <print_free_list>:
static Header base;
static Header *freep;

// print free list status
void
print_free_list(){
 600:	55                   	push   %ebp
 601:	89 e5                	mov    %esp,%ebp
 603:	53                   	push   %ebx
 604:	83 ec 0c             	sub    $0xc,%esp
  Header* p;
  printf(1, "Header -> ");
 607:	68 41 09 00 00       	push   $0x941
 60c:	6a 01                	push   $0x1
 60e:	e8 1d fe ff ff       	call   430 <printf>
  if(freep == 0){ 
 613:	a1 88 0c 00 00       	mov    0xc88,%eax
 618:	83 c4 10             	add    $0x10,%esp
 61b:	85 c0                	test   %eax,%eax
 61d:	74 30                	je     64f <print_free_list+0x4f>
    printf(1, "NULL\n");
    return;
  }
  for(p = base.s.ptr; p != &base; p = p->s.ptr){
 61f:	8b 1d 8c 0c 00 00    	mov    0xc8c,%ebx
 625:	81 fb 8c 0c 00 00    	cmp    $0xc8c,%ebx
 62b:	74 22                	je     64f <print_free_list+0x4f>
 62d:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "%d -> ", p->s.size);
 630:	83 ec 04             	sub    $0x4,%esp
 633:	ff 73 04             	pushl  0x4(%ebx)
 636:	68 52 09 00 00       	push   $0x952
 63b:	6a 01                	push   $0x1
 63d:	e8 ee fd ff ff       	call   430 <printf>
  for(p = base.s.ptr; p != &base; p = p->s.ptr){
 642:	8b 1b                	mov    (%ebx),%ebx
 644:	83 c4 10             	add    $0x10,%esp
 647:	81 fb 8c 0c 00 00    	cmp    $0xc8c,%ebx
 64d:	75 e1                	jne    630 <print_free_list+0x30>
    printf(1, "NULL\n");
 64f:	83 ec 08             	sub    $0x8,%esp
 652:	68 4c 09 00 00       	push   $0x94c
 657:	6a 01                	push   $0x1
 659:	e8 d2 fd ff ff       	call   430 <printf>
  }
  printf(1, "NULL\n");
}
 65e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 661:	c9                   	leave  
 662:	c3                   	ret    
 663:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 669:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000670 <free>:

void
free(void *ap)
{
 670:	55                   	push   %ebp
  Header *bp, *p;
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 671:	a1 88 0c 00 00       	mov    0xc88,%eax
{
 676:	89 e5                	mov    %esp,%ebp
 678:	57                   	push   %edi
 679:	56                   	push   %esi
 67a:	53                   	push   %ebx
 67b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 67e:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 680:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 683:	39 c8                	cmp    %ecx,%eax
 685:	73 19                	jae    6a0 <free+0x30>
 687:	89 f6                	mov    %esi,%esi
 689:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 690:	39 d1                	cmp    %edx,%ecx
 692:	72 14                	jb     6a8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 694:	39 d0                	cmp    %edx,%eax
 696:	73 10                	jae    6a8 <free+0x38>
{
 698:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 69a:	8b 10                	mov    (%eax),%edx
 69c:	39 c8                	cmp    %ecx,%eax
 69e:	72 f0                	jb     690 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6a0:	39 d0                	cmp    %edx,%eax
 6a2:	72 f4                	jb     698 <free+0x28>
 6a4:	39 d1                	cmp    %edx,%ecx
 6a6:	73 f0                	jae    698 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6a8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6ab:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6ae:	39 fa                	cmp    %edi,%edx
 6b0:	74 1e                	je     6d0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6b2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6b5:	8b 50 04             	mov    0x4(%eax),%edx
 6b8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6bb:	39 f1                	cmp    %esi,%ecx
 6bd:	74 28                	je     6e7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6bf:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 6c1:	5b                   	pop    %ebx
  freep = p;
 6c2:	a3 88 0c 00 00       	mov    %eax,0xc88
}
 6c7:	5e                   	pop    %esi
 6c8:	5f                   	pop    %edi
 6c9:	5d                   	pop    %ebp
 6ca:	c3                   	ret    
 6cb:	90                   	nop
 6cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 6d0:	03 72 04             	add    0x4(%edx),%esi
 6d3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6d6:	8b 10                	mov    (%eax),%edx
 6d8:	8b 12                	mov    (%edx),%edx
 6da:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6dd:	8b 50 04             	mov    0x4(%eax),%edx
 6e0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6e3:	39 f1                	cmp    %esi,%ecx
 6e5:	75 d8                	jne    6bf <free+0x4f>
    p->s.size += bp->s.size;
 6e7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 6ea:	a3 88 0c 00 00       	mov    %eax,0xc88
    p->s.size += bp->s.size;
 6ef:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6f2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6f5:	89 10                	mov    %edx,(%eax)
}
 6f7:	5b                   	pop    %ebx
 6f8:	5e                   	pop    %esi
 6f9:	5f                   	pop    %edi
 6fa:	5d                   	pop    %ebp
 6fb:	c3                   	ret    
 6fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000700 <morecore>:

static Header*
morecore(uint nu)
{
 700:	55                   	push   %ebp
 701:	89 e5                	mov    %esp,%ebp
 703:	53                   	push   %ebx
 704:	bb 00 10 00 00       	mov    $0x1000,%ebx
 709:	83 ec 10             	sub    $0x10,%esp
 70c:	3d 00 10 00 00       	cmp    $0x1000,%eax
 711:	0f 43 d8             	cmovae %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 714:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 71b:	50                   	push   %eax
 71c:	e8 3a fc ff ff       	call   35b <sbrk>
  if(p == (char*)-1)
 721:	83 c4 10             	add    $0x10,%esp
 724:	83 f8 ff             	cmp    $0xffffffff,%eax
 727:	74 1f                	je     748 <morecore+0x48>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 729:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 72c:	83 ec 0c             	sub    $0xc,%esp
 72f:	83 c0 08             	add    $0x8,%eax
 732:	50                   	push   %eax
 733:	e8 38 ff ff ff       	call   670 <free>
  return freep;
 738:	a1 88 0c 00 00       	mov    0xc88,%eax
}
 73d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  return freep;
 740:	83 c4 10             	add    $0x10,%esp
}
 743:	c9                   	leave  
 744:	c3                   	ret    
 745:	8d 76 00             	lea    0x0(%esi),%esi
 748:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return 0;
 74b:	31 c0                	xor    %eax,%eax
}
 74d:	c9                   	leave  
 74e:	c3                   	ret    
 74f:	90                   	nop

00000750 <malloc>:

void*
malloc(uint nbytes)
{
 750:	55                   	push   %ebp
  Header *p, *prevp;
  uint nunits;
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 751:	8b 0d 88 0c 00 00    	mov    0xc88,%ecx
{
 757:	89 e5                	mov    %esp,%ebp
 759:	56                   	push   %esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 75a:	8b 45 08             	mov    0x8(%ebp),%eax
{
 75d:	53                   	push   %ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 75e:	8d 58 07             	lea    0x7(%eax),%ebx
 761:	c1 eb 03             	shr    $0x3,%ebx
 764:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 767:	85 c9                	test   %ecx,%ecx
 769:	74 65                	je     7d0 <malloc+0x80>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 76b:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 76d:	8b 50 04             	mov    0x4(%eax),%edx
 770:	39 d3                	cmp    %edx,%ebx
 772:	77 1d                	ja     791 <malloc+0x41>
 774:	eb 2e                	jmp    7a4 <malloc+0x54>
 776:	8d 76 00             	lea    0x0(%esi),%esi
 779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 780:	8b 30                	mov    (%eax),%esi
    if(p->s.size >= nunits){
 782:	8b 56 04             	mov    0x4(%esi),%edx
 785:	39 da                	cmp    %ebx,%edx
 787:	73 27                	jae    7b0 <malloc+0x60>
 789:	8b 0d 88 0c 00 00    	mov    0xc88,%ecx
 78f:	89 f0                	mov    %esi,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 791:	39 c1                	cmp    %eax,%ecx
 793:	75 eb                	jne    780 <malloc+0x30>
      if((p = morecore(nunits)) == 0)
 795:	89 d8                	mov    %ebx,%eax
 797:	e8 64 ff ff ff       	call   700 <morecore>
 79c:	85 c0                	test   %eax,%eax
 79e:	75 e0                	jne    780 <malloc+0x30>
        return 0;
  }
}
 7a0:	5b                   	pop    %ebx
 7a1:	5e                   	pop    %esi
 7a2:	5d                   	pop    %ebp
 7a3:	c3                   	ret    
    if(p->s.size >= nunits){
 7a4:	89 c6                	mov    %eax,%esi
 7a6:	89 c8                	mov    %ecx,%eax
 7a8:	90                   	nop
 7a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 7b0:	39 d3                	cmp    %edx,%ebx
 7b2:	74 4c                	je     800 <malloc+0xb0>
        p->s.size -= nunits;
 7b4:	29 da                	sub    %ebx,%edx
 7b6:	89 56 04             	mov    %edx,0x4(%esi)
        p += p->s.size;
 7b9:	8d 34 d6             	lea    (%esi,%edx,8),%esi
        p->s.size = nunits;
 7bc:	89 5e 04             	mov    %ebx,0x4(%esi)
}
 7bf:	5b                   	pop    %ebx
      freep = prevp;
 7c0:	a3 88 0c 00 00       	mov    %eax,0xc88
      return (void*)(p + 1);
 7c5:	8d 46 08             	lea    0x8(%esi),%eax
}
 7c8:	5e                   	pop    %esi
 7c9:	5d                   	pop    %ebp
 7ca:	c3                   	ret    
 7cb:	90                   	nop
 7cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 7d0:	c7 05 88 0c 00 00 8c 	movl   $0xc8c,0xc88
 7d7:	0c 00 00 
    base.s.size = 0;
 7da:	b9 8c 0c 00 00       	mov    $0xc8c,%ecx
    base.s.ptr = freep = prevp = &base;
 7df:	c7 05 8c 0c 00 00 8c 	movl   $0xc8c,0xc8c
 7e6:	0c 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7e9:	89 c8                	mov    %ecx,%eax
    base.s.size = 0;
 7eb:	c7 05 90 0c 00 00 00 	movl   $0x0,0xc90
 7f2:	00 00 00 
    if(p->s.size >= nunits){
 7f5:	eb 9a                	jmp    791 <malloc+0x41>
 7f7:	89 f6                	mov    %esi,%esi
 7f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        prevp->s.ptr = p->s.ptr;
 800:	8b 16                	mov    (%esi),%edx
 802:	89 10                	mov    %edx,(%eax)
 804:	eb b9                	jmp    7bf <malloc+0x6f>
 806:	8d 76 00             	lea    0x0(%esi),%esi
 809:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000810 <malloc_wf>:

// modify malloc to implement 'worst fit' strategy
void*
malloc_wf(uint nbytes)
{
 810:	55                   	push   %ebp
 811:	89 e5                	mov    %esp,%ebp
 813:	57                   	push   %edi
 814:	56                   	push   %esi
 815:	53                   	push   %ebx
 816:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp, *maxp, *maxprevp;
  uint nunits;
  uint max = 0;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 819:	8b 45 08             	mov    0x8(%ebp),%eax
 81c:	83 c0 07             	add    $0x7,%eax
 81f:	c1 e8 03             	shr    $0x3,%eax
 822:	83 c0 01             	add    $0x1,%eax
 825:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 828:	90                   	nop
 829:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  if((prevp = freep) == 0){
 830:	8b 1d 88 0c 00 00    	mov    0xc88,%ebx
 836:	85 db                	test   %ebx,%ebx
 838:	74 66                	je     8a0 <malloc_wf+0x90>
 83a:	8b 03                	mov    (%ebx),%eax
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }

  maxp = 0;
  maxprevp = 0;
 83c:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  if((prevp = freep) == 0){
 843:	89 df                	mov    %ebx,%edi
  uint max = 0;
 845:	31 f6                	xor    %esi,%esi
  maxp = 0;
 847:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
 84e:	8b 50 04             	mov    0x4(%eax),%edx
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 851:	eb 12                	jmp    865 <malloc_wf+0x55>
 853:	90                   	nop
 854:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p->s.size >= nunits && p->s.size > max){
      max = p->s.size;
      maxp = p;
      maxprevp = prevp;
    }
    if(p == freep)
 858:	39 d8                	cmp    %ebx,%eax
 85a:	74 24                	je     880 <malloc_wf+0x70>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 85c:	8b 08                	mov    (%eax),%ecx
    if(p->s.size >= nunits && p->s.size > max){
 85e:	89 c7                	mov    %eax,%edi
 860:	8b 51 04             	mov    0x4(%ecx),%edx
 863:	89 c8                	mov    %ecx,%eax
 865:	39 d6                	cmp    %edx,%esi
 867:	73 ef                	jae    858 <malloc_wf+0x48>
 869:	39 55 e4             	cmp    %edx,-0x1c(%ebp)
 86c:	77 ea                	ja     858 <malloc_wf+0x48>
    if(p == freep)
 86e:	39 d8                	cmp    %ebx,%eax
 870:	74 57                	je     8c9 <malloc_wf+0xb9>
 872:	89 7d dc             	mov    %edi,-0x24(%ebp)
 875:	89 d6                	mov    %edx,%esi
 877:	89 45 e0             	mov    %eax,-0x20(%ebp)
 87a:	eb e0                	jmp    85c <malloc_wf+0x4c>
 87c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      break;
  }

  if(maxp != 0){
 880:	8b 45 e0             	mov    -0x20(%ebp),%eax
 883:	85 c0                	test   %eax,%eax
 885:	75 39                	jne    8c0 <malloc_wf+0xb0>
      p->s.size = nunits;
    }
    freep = prevp;
    return (void*)(p + 1);
  } else {
    if((p = morecore(nunits)) == 0)
 887:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 88a:	e8 71 fe ff ff       	call   700 <morecore>
 88f:	85 c0                	test   %eax,%eax
 891:	75 9d                	jne    830 <malloc_wf+0x20>
      return 0;
    return malloc_wf(nbytes);
  }
 893:	83 c4 1c             	add    $0x1c,%esp
 896:	5b                   	pop    %ebx
 897:	5e                   	pop    %esi
 898:	5f                   	pop    %edi
 899:	5d                   	pop    %ebp
 89a:	c3                   	ret    
 89b:	90                   	nop
 89c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 8a0:	c7 05 88 0c 00 00 8c 	movl   $0xc8c,0xc88
 8a7:	0c 00 00 
 8aa:	c7 05 8c 0c 00 00 8c 	movl   $0xc8c,0xc8c
 8b1:	0c 00 00 
    base.s.size = 0;
 8b4:	c7 05 90 0c 00 00 00 	movl   $0x0,0xc90
 8bb:	00 00 00 
  if(maxp != 0){
 8be:	eb c7                	jmp    887 <malloc_wf+0x77>
 8c0:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 8c3:	8b 7d dc             	mov    -0x24(%ebp),%edi
 8c6:	8b 53 04             	mov    0x4(%ebx),%edx
    if(p->s.size == nunits){
 8c9:	39 55 e4             	cmp    %edx,-0x1c(%ebp)
 8cc:	74 1f                	je     8ed <malloc_wf+0xdd>
      p->s.size -= nunits;
 8ce:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8d1:	29 c2                	sub    %eax,%edx
 8d3:	89 53 04             	mov    %edx,0x4(%ebx)
      p = p + p->s.size;
 8d6:	8d 1c d3             	lea    (%ebx,%edx,8),%ebx
      p->s.size = nunits;
 8d9:	89 43 04             	mov    %eax,0x4(%ebx)
    freep = prevp;
 8dc:	89 3d 88 0c 00 00    	mov    %edi,0xc88
 8e2:	83 c4 1c             	add    $0x1c,%esp
    return (void*)(p + 1);
 8e5:	8d 43 08             	lea    0x8(%ebx),%eax
 8e8:	5b                   	pop    %ebx
 8e9:	5e                   	pop    %esi
 8ea:	5f                   	pop    %edi
 8eb:	5d                   	pop    %ebp
 8ec:	c3                   	ret    
      prevp->s.ptr = p->s.ptr;
 8ed:	8b 03                	mov    (%ebx),%eax
 8ef:	89 07                	mov    %eax,(%edi)
 8f1:	eb e9                	jmp    8dc <malloc_wf+0xcc>
