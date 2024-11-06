
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  }
}

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	be 01 00 00 00       	mov    $0x1,%esi
  14:	53                   	push   %ebx
  15:	51                   	push   %ecx
  16:	83 ec 18             	sub    $0x18,%esp
  19:	8b 01                	mov    (%ecx),%eax
  1b:	8b 59 04             	mov    0x4(%ecx),%ebx
  1e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  21:	83 c3 04             	add    $0x4,%ebx
  int fd, i;

  if(argc <= 1){
  24:	83 f8 01             	cmp    $0x1,%eax
  27:	7e 54                	jle    7d <main+0x7d>
  29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  30:	83 ec 08             	sub    $0x8,%esp
  33:	6a 00                	push   $0x0
  35:	ff 33                	pushl  (%ebx)
  37:	e8 67 03 00 00       	call   3a3 <open>
  3c:	83 c4 10             	add    $0x10,%esp
  3f:	89 c7                	mov    %eax,%edi
  41:	85 c0                	test   %eax,%eax
  43:	78 24                	js     69 <main+0x69>
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
  45:	83 ec 0c             	sub    $0xc,%esp
  for(i = 1; i < argc; i++){
  48:	83 c6 01             	add    $0x1,%esi
  4b:	83 c3 04             	add    $0x4,%ebx
    cat(fd);
  4e:	50                   	push   %eax
  4f:	e8 3c 00 00 00       	call   90 <cat>
    close(fd);
  54:	89 3c 24             	mov    %edi,(%esp)
  57:	e8 2f 03 00 00       	call   38b <close>
  for(i = 1; i < argc; i++){
  5c:	83 c4 10             	add    $0x10,%esp
  5f:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  62:	75 cc                	jne    30 <main+0x30>
  }
  exit();
  64:	e8 fa 02 00 00       	call   363 <exit>
      printf(1, "cat: cannot open %s\n", argv[i]);
  69:	50                   	push   %eax
  6a:	ff 33                	pushl  (%ebx)
  6c:	68 a7 09 00 00       	push   $0x9a7
  71:	6a 01                	push   $0x1
  73:	e8 48 04 00 00       	call   4c0 <printf>
      exit();
  78:	e8 e6 02 00 00       	call   363 <exit>
    cat(0);
  7d:	83 ec 0c             	sub    $0xc,%esp
  80:	6a 00                	push   $0x0
  82:	e8 09 00 00 00       	call   90 <cat>
    exit();
  87:	e8 d7 02 00 00       	call   363 <exit>
  8c:	66 90                	xchg   %ax,%ax
  8e:	66 90                	xchg   %ax,%ax

00000090 <cat>:
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	56                   	push   %esi
  94:	8b 75 08             	mov    0x8(%ebp),%esi
  97:	53                   	push   %ebx
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  98:	eb 1d                	jmp    b7 <cat+0x27>
  9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if (write(1, buf, n) != n) {
  a0:	83 ec 04             	sub    $0x4,%esp
  a3:	53                   	push   %ebx
  a4:	68 80 0d 00 00       	push   $0xd80
  a9:	6a 01                	push   $0x1
  ab:	e8 d3 02 00 00       	call   383 <write>
  b0:	83 c4 10             	add    $0x10,%esp
  b3:	39 d8                	cmp    %ebx,%eax
  b5:	75 25                	jne    dc <cat+0x4c>
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  b7:	83 ec 04             	sub    $0x4,%esp
  ba:	68 00 02 00 00       	push   $0x200
  bf:	68 80 0d 00 00       	push   $0xd80
  c4:	56                   	push   %esi
  c5:	e8 b1 02 00 00       	call   37b <read>
  ca:	83 c4 10             	add    $0x10,%esp
  cd:	89 c3                	mov    %eax,%ebx
  cf:	85 c0                	test   %eax,%eax
  d1:	7f cd                	jg     a0 <cat+0x10>
  if(n < 0){
  d3:	75 1b                	jne    f0 <cat+0x60>
}
  d5:	8d 65 f8             	lea    -0x8(%ebp),%esp
  d8:	5b                   	pop    %ebx
  d9:	5e                   	pop    %esi
  da:	5d                   	pop    %ebp
  db:	c3                   	ret    
      printf(1, "cat: write error\n");
  dc:	83 ec 08             	sub    $0x8,%esp
  df:	68 84 09 00 00       	push   $0x984
  e4:	6a 01                	push   $0x1
  e6:	e8 d5 03 00 00       	call   4c0 <printf>
      exit();
  eb:	e8 73 02 00 00       	call   363 <exit>
    printf(1, "cat: read error\n");
  f0:	50                   	push   %eax
  f1:	50                   	push   %eax
  f2:	68 96 09 00 00       	push   $0x996
  f7:	6a 01                	push   $0x1
  f9:	e8 c2 03 00 00       	call   4c0 <printf>
    exit();
  fe:	e8 60 02 00 00       	call   363 <exit>
 103:	66 90                	xchg   %ax,%ax
 105:	66 90                	xchg   %ax,%ax
 107:	66 90                	xchg   %ax,%ax
 109:	66 90                	xchg   %ax,%ax
 10b:	66 90                	xchg   %ax,%ax
 10d:	66 90                	xchg   %ax,%ax
 10f:	90                   	nop

00000110 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 110:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 111:	31 c0                	xor    %eax,%eax
{
 113:	89 e5                	mov    %esp,%ebp
 115:	53                   	push   %ebx
 116:	8b 4d 08             	mov    0x8(%ebp),%ecx
 119:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 11c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 120:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 124:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 127:	83 c0 01             	add    $0x1,%eax
 12a:	84 d2                	test   %dl,%dl
 12c:	75 f2                	jne    120 <strcpy+0x10>
    ;
  return os;
}
 12e:	89 c8                	mov    %ecx,%eax
 130:	5b                   	pop    %ebx
 131:	5d                   	pop    %ebp
 132:	c3                   	ret    
 133:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000140 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	53                   	push   %ebx
 144:	8b 4d 08             	mov    0x8(%ebp),%ecx
 147:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 14a:	0f b6 01             	movzbl (%ecx),%eax
 14d:	0f b6 1a             	movzbl (%edx),%ebx
 150:	84 c0                	test   %al,%al
 152:	75 1d                	jne    171 <strcmp+0x31>
 154:	eb 2a                	jmp    180 <strcmp+0x40>
 156:	8d 76 00             	lea    0x0(%esi),%esi
 159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 160:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 164:	83 c1 01             	add    $0x1,%ecx
 167:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 16a:	0f b6 1a             	movzbl (%edx),%ebx
 16d:	84 c0                	test   %al,%al
 16f:	74 0f                	je     180 <strcmp+0x40>
 171:	38 d8                	cmp    %bl,%al
 173:	74 eb                	je     160 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 175:	29 d8                	sub    %ebx,%eax
}
 177:	5b                   	pop    %ebx
 178:	5d                   	pop    %ebp
 179:	c3                   	ret    
 17a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 180:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 182:	29 d8                	sub    %ebx,%eax
}
 184:	5b                   	pop    %ebx
 185:	5d                   	pop    %ebp
 186:	c3                   	ret    
 187:	89 f6                	mov    %esi,%esi
 189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000190 <strlen>:

uint
strlen(const char *s)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 196:	80 3a 00             	cmpb   $0x0,(%edx)
 199:	74 15                	je     1b0 <strlen+0x20>
 19b:	31 c0                	xor    %eax,%eax
 19d:	8d 76 00             	lea    0x0(%esi),%esi
 1a0:	83 c0 01             	add    $0x1,%eax
 1a3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1a7:	89 c1                	mov    %eax,%ecx
 1a9:	75 f5                	jne    1a0 <strlen+0x10>
    ;
  return n;
}
 1ab:	89 c8                	mov    %ecx,%eax
 1ad:	5d                   	pop    %ebp
 1ae:	c3                   	ret    
 1af:	90                   	nop
  for(n = 0; s[n]; n++)
 1b0:	31 c9                	xor    %ecx,%ecx
}
 1b2:	5d                   	pop    %ebp
 1b3:	89 c8                	mov    %ecx,%eax
 1b5:	c3                   	ret    
 1b6:	8d 76 00             	lea    0x0(%esi),%esi
 1b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001c0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	57                   	push   %edi
 1c4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1c7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 1cd:	89 d7                	mov    %edx,%edi
 1cf:	fc                   	cld    
 1d0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1d2:	89 d0                	mov    %edx,%eax
 1d4:	5f                   	pop    %edi
 1d5:	5d                   	pop    %ebp
 1d6:	c3                   	ret    
 1d7:	89 f6                	mov    %esi,%esi
 1d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001e0 <strchr>:

char*
strchr(const char *s, char c)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	8b 45 08             	mov    0x8(%ebp),%eax
 1e6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1ea:	0f b6 10             	movzbl (%eax),%edx
 1ed:	84 d2                	test   %dl,%dl
 1ef:	75 12                	jne    203 <strchr+0x23>
 1f1:	eb 1d                	jmp    210 <strchr+0x30>
 1f3:	90                   	nop
 1f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1f8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 1fc:	83 c0 01             	add    $0x1,%eax
 1ff:	84 d2                	test   %dl,%dl
 201:	74 0d                	je     210 <strchr+0x30>
    if(*s == c)
 203:	38 d1                	cmp    %dl,%cl
 205:	75 f1                	jne    1f8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 207:	5d                   	pop    %ebp
 208:	c3                   	ret    
 209:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 210:	31 c0                	xor    %eax,%eax
}
 212:	5d                   	pop    %ebp
 213:	c3                   	ret    
 214:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 21a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000220 <gets>:

char*
gets(char *buf, int max)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	57                   	push   %edi
 224:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 225:	31 f6                	xor    %esi,%esi
{
 227:	53                   	push   %ebx
 228:	89 f3                	mov    %esi,%ebx
 22a:	83 ec 1c             	sub    $0x1c,%esp
 22d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 230:	eb 2f                	jmp    261 <gets+0x41>
 232:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 238:	83 ec 04             	sub    $0x4,%esp
 23b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 23e:	6a 01                	push   $0x1
 240:	50                   	push   %eax
 241:	6a 00                	push   $0x0
 243:	e8 33 01 00 00       	call   37b <read>
    if(cc < 1)
 248:	83 c4 10             	add    $0x10,%esp
 24b:	85 c0                	test   %eax,%eax
 24d:	7e 1c                	jle    26b <gets+0x4b>
      break;
    buf[i++] = c;
 24f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 253:	83 c7 01             	add    $0x1,%edi
 256:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 259:	3c 0a                	cmp    $0xa,%al
 25b:	74 23                	je     280 <gets+0x60>
 25d:	3c 0d                	cmp    $0xd,%al
 25f:	74 1f                	je     280 <gets+0x60>
  for(i=0; i+1 < max; ){
 261:	83 c3 01             	add    $0x1,%ebx
 264:	89 fe                	mov    %edi,%esi
 266:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 269:	7c cd                	jl     238 <gets+0x18>
 26b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 26d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 270:	c6 03 00             	movb   $0x0,(%ebx)
}
 273:	8d 65 f4             	lea    -0xc(%ebp),%esp
 276:	5b                   	pop    %ebx
 277:	5e                   	pop    %esi
 278:	5f                   	pop    %edi
 279:	5d                   	pop    %ebp
 27a:	c3                   	ret    
 27b:	90                   	nop
 27c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 280:	8b 75 08             	mov    0x8(%ebp),%esi
 283:	8b 45 08             	mov    0x8(%ebp),%eax
 286:	01 de                	add    %ebx,%esi
 288:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 28a:	c6 03 00             	movb   $0x0,(%ebx)
}
 28d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 290:	5b                   	pop    %ebx
 291:	5e                   	pop    %esi
 292:	5f                   	pop    %edi
 293:	5d                   	pop    %ebp
 294:	c3                   	ret    
 295:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002a0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	56                   	push   %esi
 2a4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2a5:	83 ec 08             	sub    $0x8,%esp
 2a8:	6a 00                	push   $0x0
 2aa:	ff 75 08             	pushl  0x8(%ebp)
 2ad:	e8 f1 00 00 00       	call   3a3 <open>
  if(fd < 0)
 2b2:	83 c4 10             	add    $0x10,%esp
 2b5:	85 c0                	test   %eax,%eax
 2b7:	78 27                	js     2e0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 2b9:	83 ec 08             	sub    $0x8,%esp
 2bc:	ff 75 0c             	pushl  0xc(%ebp)
 2bf:	89 c3                	mov    %eax,%ebx
 2c1:	50                   	push   %eax
 2c2:	e8 f4 00 00 00       	call   3bb <fstat>
  close(fd);
 2c7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2ca:	89 c6                	mov    %eax,%esi
  close(fd);
 2cc:	e8 ba 00 00 00       	call   38b <close>
  return r;
 2d1:	83 c4 10             	add    $0x10,%esp
}
 2d4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2d7:	89 f0                	mov    %esi,%eax
 2d9:	5b                   	pop    %ebx
 2da:	5e                   	pop    %esi
 2db:	5d                   	pop    %ebp
 2dc:	c3                   	ret    
 2dd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 2e0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2e5:	eb ed                	jmp    2d4 <stat+0x34>
 2e7:	89 f6                	mov    %esi,%esi
 2e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002f0 <atoi>:

int
atoi(const char *s)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	53                   	push   %ebx
 2f4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2f7:	0f be 02             	movsbl (%edx),%eax
 2fa:	8d 48 d0             	lea    -0x30(%eax),%ecx
 2fd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 300:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 305:	77 1e                	ja     325 <atoi+0x35>
 307:	89 f6                	mov    %esi,%esi
 309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 310:	83 c2 01             	add    $0x1,%edx
 313:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 316:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 31a:	0f be 02             	movsbl (%edx),%eax
 31d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 320:	80 fb 09             	cmp    $0x9,%bl
 323:	76 eb                	jbe    310 <atoi+0x20>
  return n;
}
 325:	89 c8                	mov    %ecx,%eax
 327:	5b                   	pop    %ebx
 328:	5d                   	pop    %ebp
 329:	c3                   	ret    
 32a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000330 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	57                   	push   %edi
 334:	8b 45 10             	mov    0x10(%ebp),%eax
 337:	8b 55 08             	mov    0x8(%ebp),%edx
 33a:	56                   	push   %esi
 33b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 33e:	85 c0                	test   %eax,%eax
 340:	7e 13                	jle    355 <memmove+0x25>
 342:	01 d0                	add    %edx,%eax
  dst = vdst;
 344:	89 d7                	mov    %edx,%edi
 346:	8d 76 00             	lea    0x0(%esi),%esi
 349:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    *dst++ = *src++;
 350:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 351:	39 f8                	cmp    %edi,%eax
 353:	75 fb                	jne    350 <memmove+0x20>
  return vdst;
}
 355:	5e                   	pop    %esi
 356:	89 d0                	mov    %edx,%eax
 358:	5f                   	pop    %edi
 359:	5d                   	pop    %ebp
 35a:	c3                   	ret    

0000035b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 35b:	b8 01 00 00 00       	mov    $0x1,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret    

00000363 <exit>:
SYSCALL(exit)
 363:	b8 02 00 00 00       	mov    $0x2,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret    

0000036b <wait>:
SYSCALL(wait)
 36b:	b8 03 00 00 00       	mov    $0x3,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret    

00000373 <pipe>:
SYSCALL(pipe)
 373:	b8 04 00 00 00       	mov    $0x4,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret    

0000037b <read>:
SYSCALL(read)
 37b:	b8 05 00 00 00       	mov    $0x5,%eax
 380:	cd 40                	int    $0x40
 382:	c3                   	ret    

00000383 <write>:
SYSCALL(write)
 383:	b8 10 00 00 00       	mov    $0x10,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret    

0000038b <close>:
SYSCALL(close)
 38b:	b8 15 00 00 00       	mov    $0x15,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret    

00000393 <kill>:
SYSCALL(kill)
 393:	b8 06 00 00 00       	mov    $0x6,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret    

0000039b <exec>:
SYSCALL(exec)
 39b:	b8 07 00 00 00       	mov    $0x7,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret    

000003a3 <open>:
SYSCALL(open)
 3a3:	b8 0f 00 00 00       	mov    $0xf,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret    

000003ab <mknod>:
SYSCALL(mknod)
 3ab:	b8 11 00 00 00       	mov    $0x11,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret    

000003b3 <unlink>:
SYSCALL(unlink)
 3b3:	b8 12 00 00 00       	mov    $0x12,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret    

000003bb <fstat>:
SYSCALL(fstat)
 3bb:	b8 08 00 00 00       	mov    $0x8,%eax
 3c0:	cd 40                	int    $0x40
 3c2:	c3                   	ret    

000003c3 <link>:
SYSCALL(link)
 3c3:	b8 13 00 00 00       	mov    $0x13,%eax
 3c8:	cd 40                	int    $0x40
 3ca:	c3                   	ret    

000003cb <mkdir>:
SYSCALL(mkdir)
 3cb:	b8 14 00 00 00       	mov    $0x14,%eax
 3d0:	cd 40                	int    $0x40
 3d2:	c3                   	ret    

000003d3 <chdir>:
SYSCALL(chdir)
 3d3:	b8 09 00 00 00       	mov    $0x9,%eax
 3d8:	cd 40                	int    $0x40
 3da:	c3                   	ret    

000003db <dup>:
SYSCALL(dup)
 3db:	b8 0a 00 00 00       	mov    $0xa,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret    

000003e3 <getpid>:
SYSCALL(getpid)
 3e3:	b8 0b 00 00 00       	mov    $0xb,%eax
 3e8:	cd 40                	int    $0x40
 3ea:	c3                   	ret    

000003eb <sbrk>:
SYSCALL(sbrk)
 3eb:	b8 0c 00 00 00       	mov    $0xc,%eax
 3f0:	cd 40                	int    $0x40
 3f2:	c3                   	ret    

000003f3 <sleep>:
SYSCALL(sleep)
 3f3:	b8 0d 00 00 00       	mov    $0xd,%eax
 3f8:	cd 40                	int    $0x40
 3fa:	c3                   	ret    

000003fb <uptime>:
SYSCALL(uptime)
 3fb:	b8 0e 00 00 00       	mov    $0xe,%eax
 400:	cd 40                	int    $0x40
 402:	c3                   	ret    

00000403 <walkpt>:
SYSCALL(walkpt)
 403:	b8 16 00 00 00       	mov    $0x16,%eax
 408:	cd 40                	int    $0x40
 40a:	c3                   	ret    
 40b:	66 90                	xchg   %ax,%ax
 40d:	66 90                	xchg   %ax,%ax
 40f:	90                   	nop

00000410 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	57                   	push   %edi
 414:	56                   	push   %esi
 415:	53                   	push   %ebx
 416:	83 ec 3c             	sub    $0x3c,%esp
 419:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 41c:	89 d1                	mov    %edx,%ecx
{
 41e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 421:	85 d2                	test   %edx,%edx
 423:	0f 89 7f 00 00 00    	jns    4a8 <printint+0x98>
 429:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 42d:	74 79                	je     4a8 <printint+0x98>
    neg = 1;
 42f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 436:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 438:	31 db                	xor    %ebx,%ebx
 43a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 43d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 440:	89 c8                	mov    %ecx,%eax
 442:	31 d2                	xor    %edx,%edx
 444:	89 cf                	mov    %ecx,%edi
 446:	f7 75 c4             	divl   -0x3c(%ebp)
 449:	0f b6 92 c4 09 00 00 	movzbl 0x9c4(%edx),%edx
 450:	89 45 c0             	mov    %eax,-0x40(%ebp)
 453:	89 d8                	mov    %ebx,%eax
 455:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 458:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 45b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 45e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 461:	76 dd                	jbe    440 <printint+0x30>
  if(neg)
 463:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 466:	85 c9                	test   %ecx,%ecx
 468:	74 0c                	je     476 <printint+0x66>
    buf[i++] = '-';
 46a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 46f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 471:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 476:	8b 7d b8             	mov    -0x48(%ebp),%edi
 479:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 47d:	eb 07                	jmp    486 <printint+0x76>
 47f:	90                   	nop
 480:	0f b6 13             	movzbl (%ebx),%edx
 483:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 486:	83 ec 04             	sub    $0x4,%esp
 489:	88 55 d7             	mov    %dl,-0x29(%ebp)
 48c:	6a 01                	push   $0x1
 48e:	56                   	push   %esi
 48f:	57                   	push   %edi
 490:	e8 ee fe ff ff       	call   383 <write>
  while(--i >= 0)
 495:	83 c4 10             	add    $0x10,%esp
 498:	39 de                	cmp    %ebx,%esi
 49a:	75 e4                	jne    480 <printint+0x70>
    putc(fd, buf[i]);
}
 49c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 49f:	5b                   	pop    %ebx
 4a0:	5e                   	pop    %esi
 4a1:	5f                   	pop    %edi
 4a2:	5d                   	pop    %ebp
 4a3:	c3                   	ret    
 4a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 4a8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 4af:	eb 87                	jmp    438 <printint+0x28>
 4b1:	eb 0d                	jmp    4c0 <printf>
 4b3:	90                   	nop
 4b4:	90                   	nop
 4b5:	90                   	nop
 4b6:	90                   	nop
 4b7:	90                   	nop
 4b8:	90                   	nop
 4b9:	90                   	nop
 4ba:	90                   	nop
 4bb:	90                   	nop
 4bc:	90                   	nop
 4bd:	90                   	nop
 4be:	90                   	nop
 4bf:	90                   	nop

000004c0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4c0:	55                   	push   %ebp
 4c1:	89 e5                	mov    %esp,%ebp
 4c3:	57                   	push   %edi
 4c4:	56                   	push   %esi
 4c5:	53                   	push   %ebx
 4c6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4c9:	8b 75 0c             	mov    0xc(%ebp),%esi
 4cc:	0f b6 1e             	movzbl (%esi),%ebx
 4cf:	84 db                	test   %bl,%bl
 4d1:	0f 84 b8 00 00 00    	je     58f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 4d7:	8d 45 10             	lea    0x10(%ebp),%eax
 4da:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 4dd:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 4e0:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 4e2:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4e5:	eb 37                	jmp    51e <printf+0x5e>
 4e7:	89 f6                	mov    %esi,%esi
 4e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 4f0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 4f3:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 4f8:	83 f8 25             	cmp    $0x25,%eax
 4fb:	74 17                	je     514 <printf+0x54>
  write(fd, &c, 1);
 4fd:	83 ec 04             	sub    $0x4,%esp
 500:	88 5d e7             	mov    %bl,-0x19(%ebp)
 503:	6a 01                	push   $0x1
 505:	57                   	push   %edi
 506:	ff 75 08             	pushl  0x8(%ebp)
 509:	e8 75 fe ff ff       	call   383 <write>
 50e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 511:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 514:	0f b6 1e             	movzbl (%esi),%ebx
 517:	83 c6 01             	add    $0x1,%esi
 51a:	84 db                	test   %bl,%bl
 51c:	74 71                	je     58f <printf+0xcf>
    c = fmt[i] & 0xff;
 51e:	0f be cb             	movsbl %bl,%ecx
 521:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 524:	85 d2                	test   %edx,%edx
 526:	74 c8                	je     4f0 <printf+0x30>
      }
    } else if(state == '%'){
 528:	83 fa 25             	cmp    $0x25,%edx
 52b:	75 e7                	jne    514 <printf+0x54>
      if(c == 'd'){
 52d:	83 f8 64             	cmp    $0x64,%eax
 530:	0f 84 9a 00 00 00    	je     5d0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 536:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 53c:	83 f9 70             	cmp    $0x70,%ecx
 53f:	74 5f                	je     5a0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 541:	83 f8 73             	cmp    $0x73,%eax
 544:	0f 84 d6 00 00 00    	je     620 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 54a:	83 f8 63             	cmp    $0x63,%eax
 54d:	0f 84 8d 00 00 00    	je     5e0 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 553:	83 f8 25             	cmp    $0x25,%eax
 556:	0f 84 b4 00 00 00    	je     610 <printf+0x150>
  write(fd, &c, 1);
 55c:	83 ec 04             	sub    $0x4,%esp
 55f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 563:	6a 01                	push   $0x1
 565:	57                   	push   %edi
 566:	ff 75 08             	pushl  0x8(%ebp)
 569:	e8 15 fe ff ff       	call   383 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 56e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 571:	83 c4 0c             	add    $0xc,%esp
 574:	6a 01                	push   $0x1
 576:	83 c6 01             	add    $0x1,%esi
 579:	57                   	push   %edi
 57a:	ff 75 08             	pushl  0x8(%ebp)
 57d:	e8 01 fe ff ff       	call   383 <write>
  for(i = 0; fmt[i]; i++){
 582:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 586:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 589:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 58b:	84 db                	test   %bl,%bl
 58d:	75 8f                	jne    51e <printf+0x5e>
    }
  }
}
 58f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 592:	5b                   	pop    %ebx
 593:	5e                   	pop    %esi
 594:	5f                   	pop    %edi
 595:	5d                   	pop    %ebp
 596:	c3                   	ret    
 597:	89 f6                	mov    %esi,%esi
 599:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        printint(fd, *ap, 16, 0);
 5a0:	83 ec 0c             	sub    $0xc,%esp
 5a3:	b9 10 00 00 00       	mov    $0x10,%ecx
 5a8:	6a 00                	push   $0x0
 5aa:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 5ad:	8b 45 08             	mov    0x8(%ebp),%eax
 5b0:	8b 13                	mov    (%ebx),%edx
 5b2:	e8 59 fe ff ff       	call   410 <printint>
        ap++;
 5b7:	89 d8                	mov    %ebx,%eax
 5b9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5bc:	31 d2                	xor    %edx,%edx
        ap++;
 5be:	83 c0 04             	add    $0x4,%eax
 5c1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5c4:	e9 4b ff ff ff       	jmp    514 <printf+0x54>
 5c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 5d0:	83 ec 0c             	sub    $0xc,%esp
 5d3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5d8:	6a 01                	push   $0x1
 5da:	eb ce                	jmp    5aa <printf+0xea>
 5dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 5e0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 5e3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 5e6:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 5e8:	6a 01                	push   $0x1
        ap++;
 5ea:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 5ed:	57                   	push   %edi
 5ee:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 5f1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 5f4:	e8 8a fd ff ff       	call   383 <write>
        ap++;
 5f9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 5fc:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5ff:	31 d2                	xor    %edx,%edx
 601:	e9 0e ff ff ff       	jmp    514 <printf+0x54>
 606:	8d 76 00             	lea    0x0(%esi),%esi
 609:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        putc(fd, c);
 610:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 613:	83 ec 04             	sub    $0x4,%esp
 616:	e9 59 ff ff ff       	jmp    574 <printf+0xb4>
 61b:	90                   	nop
 61c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 620:	8b 45 d0             	mov    -0x30(%ebp),%eax
 623:	8b 18                	mov    (%eax),%ebx
        ap++;
 625:	83 c0 04             	add    $0x4,%eax
 628:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 62b:	85 db                	test   %ebx,%ebx
 62d:	74 17                	je     646 <printf+0x186>
        while(*s != 0){
 62f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 632:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 634:	84 c0                	test   %al,%al
 636:	0f 84 d8 fe ff ff    	je     514 <printf+0x54>
 63c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 63f:	89 de                	mov    %ebx,%esi
 641:	8b 5d 08             	mov    0x8(%ebp),%ebx
 644:	eb 1a                	jmp    660 <printf+0x1a0>
          s = "(null)";
 646:	bb bc 09 00 00       	mov    $0x9bc,%ebx
        while(*s != 0){
 64b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 64e:	b8 28 00 00 00       	mov    $0x28,%eax
 653:	89 de                	mov    %ebx,%esi
 655:	8b 5d 08             	mov    0x8(%ebp),%ebx
 658:	90                   	nop
 659:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 660:	83 ec 04             	sub    $0x4,%esp
          s++;
 663:	83 c6 01             	add    $0x1,%esi
 666:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 669:	6a 01                	push   $0x1
 66b:	57                   	push   %edi
 66c:	53                   	push   %ebx
 66d:	e8 11 fd ff ff       	call   383 <write>
        while(*s != 0){
 672:	0f b6 06             	movzbl (%esi),%eax
 675:	83 c4 10             	add    $0x10,%esp
 678:	84 c0                	test   %al,%al
 67a:	75 e4                	jne    660 <printf+0x1a0>
 67c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 67f:	31 d2                	xor    %edx,%edx
 681:	e9 8e fe ff ff       	jmp    514 <printf+0x54>
 686:	66 90                	xchg   %ax,%ax
 688:	66 90                	xchg   %ax,%ax
 68a:	66 90                	xchg   %ax,%ax
 68c:	66 90                	xchg   %ax,%ax
 68e:	66 90                	xchg   %ax,%ax

00000690 <print_free_list>:
static Header base;
static Header *freep;

// print free list status
void
print_free_list(){
 690:	55                   	push   %ebp
 691:	89 e5                	mov    %esp,%ebp
 693:	53                   	push   %ebx
 694:	83 ec 0c             	sub    $0xc,%esp
  Header* p;
  printf(1, "Header -> ");
 697:	68 d5 09 00 00       	push   $0x9d5
 69c:	6a 01                	push   $0x1
 69e:	e8 1d fe ff ff       	call   4c0 <printf>
  if(freep == 0){ 
 6a3:	a1 60 0d 00 00       	mov    0xd60,%eax
 6a8:	83 c4 10             	add    $0x10,%esp
 6ab:	85 c0                	test   %eax,%eax
 6ad:	74 30                	je     6df <print_free_list+0x4f>
    printf(1, "NULL\n");
    return;
  }
  for(p = base.s.ptr; p != &base; p = p->s.ptr){
 6af:	8b 1d 64 0d 00 00    	mov    0xd64,%ebx
 6b5:	81 fb 64 0d 00 00    	cmp    $0xd64,%ebx
 6bb:	74 22                	je     6df <print_free_list+0x4f>
 6bd:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "%d -> ", p->s.size);
 6c0:	83 ec 04             	sub    $0x4,%esp
 6c3:	ff 73 04             	pushl  0x4(%ebx)
 6c6:	68 e6 09 00 00       	push   $0x9e6
 6cb:	6a 01                	push   $0x1
 6cd:	e8 ee fd ff ff       	call   4c0 <printf>
  for(p = base.s.ptr; p != &base; p = p->s.ptr){
 6d2:	8b 1b                	mov    (%ebx),%ebx
 6d4:	83 c4 10             	add    $0x10,%esp
 6d7:	81 fb 64 0d 00 00    	cmp    $0xd64,%ebx
 6dd:	75 e1                	jne    6c0 <print_free_list+0x30>
    printf(1, "NULL\n");
 6df:	83 ec 08             	sub    $0x8,%esp
 6e2:	68 e0 09 00 00       	push   $0x9e0
 6e7:	6a 01                	push   $0x1
 6e9:	e8 d2 fd ff ff       	call   4c0 <printf>
  }
  printf(1, "NULL\n");
}
 6ee:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6f1:	c9                   	leave  
 6f2:	c3                   	ret    
 6f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 6f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000700 <free>:

void
free(void *ap)
{
 700:	55                   	push   %ebp
  Header *bp, *p;
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 701:	a1 60 0d 00 00       	mov    0xd60,%eax
{
 706:	89 e5                	mov    %esp,%ebp
 708:	57                   	push   %edi
 709:	56                   	push   %esi
 70a:	53                   	push   %ebx
 70b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 70e:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 710:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 713:	39 c8                	cmp    %ecx,%eax
 715:	73 19                	jae    730 <free+0x30>
 717:	89 f6                	mov    %esi,%esi
 719:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 720:	39 d1                	cmp    %edx,%ecx
 722:	72 14                	jb     738 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 724:	39 d0                	cmp    %edx,%eax
 726:	73 10                	jae    738 <free+0x38>
{
 728:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 72a:	8b 10                	mov    (%eax),%edx
 72c:	39 c8                	cmp    %ecx,%eax
 72e:	72 f0                	jb     720 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 730:	39 d0                	cmp    %edx,%eax
 732:	72 f4                	jb     728 <free+0x28>
 734:	39 d1                	cmp    %edx,%ecx
 736:	73 f0                	jae    728 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 738:	8b 73 fc             	mov    -0x4(%ebx),%esi
 73b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 73e:	39 fa                	cmp    %edi,%edx
 740:	74 1e                	je     760 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 742:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 745:	8b 50 04             	mov    0x4(%eax),%edx
 748:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 74b:	39 f1                	cmp    %esi,%ecx
 74d:	74 28                	je     777 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 74f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 751:	5b                   	pop    %ebx
  freep = p;
 752:	a3 60 0d 00 00       	mov    %eax,0xd60
}
 757:	5e                   	pop    %esi
 758:	5f                   	pop    %edi
 759:	5d                   	pop    %ebp
 75a:	c3                   	ret    
 75b:	90                   	nop
 75c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 760:	03 72 04             	add    0x4(%edx),%esi
 763:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 766:	8b 10                	mov    (%eax),%edx
 768:	8b 12                	mov    (%edx),%edx
 76a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 76d:	8b 50 04             	mov    0x4(%eax),%edx
 770:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 773:	39 f1                	cmp    %esi,%ecx
 775:	75 d8                	jne    74f <free+0x4f>
    p->s.size += bp->s.size;
 777:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 77a:	a3 60 0d 00 00       	mov    %eax,0xd60
    p->s.size += bp->s.size;
 77f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 782:	8b 53 f8             	mov    -0x8(%ebx),%edx
 785:	89 10                	mov    %edx,(%eax)
}
 787:	5b                   	pop    %ebx
 788:	5e                   	pop    %esi
 789:	5f                   	pop    %edi
 78a:	5d                   	pop    %ebp
 78b:	c3                   	ret    
 78c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000790 <morecore>:

static Header*
morecore(uint nu)
{
 790:	55                   	push   %ebp
 791:	89 e5                	mov    %esp,%ebp
 793:	53                   	push   %ebx
 794:	bb 00 10 00 00       	mov    $0x1000,%ebx
 799:	83 ec 10             	sub    $0x10,%esp
 79c:	3d 00 10 00 00       	cmp    $0x1000,%eax
 7a1:	0f 43 d8             	cmovae %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 7a4:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7ab:	50                   	push   %eax
 7ac:	e8 3a fc ff ff       	call   3eb <sbrk>
  if(p == (char*)-1)
 7b1:	83 c4 10             	add    $0x10,%esp
 7b4:	83 f8 ff             	cmp    $0xffffffff,%eax
 7b7:	74 1f                	je     7d8 <morecore+0x48>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 7b9:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7bc:	83 ec 0c             	sub    $0xc,%esp
 7bf:	83 c0 08             	add    $0x8,%eax
 7c2:	50                   	push   %eax
 7c3:	e8 38 ff ff ff       	call   700 <free>
  return freep;
 7c8:	a1 60 0d 00 00       	mov    0xd60,%eax
}
 7cd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  return freep;
 7d0:	83 c4 10             	add    $0x10,%esp
}
 7d3:	c9                   	leave  
 7d4:	c3                   	ret    
 7d5:	8d 76 00             	lea    0x0(%esi),%esi
 7d8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return 0;
 7db:	31 c0                	xor    %eax,%eax
}
 7dd:	c9                   	leave  
 7de:	c3                   	ret    
 7df:	90                   	nop

000007e0 <malloc>:

void*
malloc(uint nbytes)
{
 7e0:	55                   	push   %ebp
  Header *p, *prevp;
  uint nunits;
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 7e1:	8b 0d 60 0d 00 00    	mov    0xd60,%ecx
{
 7e7:	89 e5                	mov    %esp,%ebp
 7e9:	56                   	push   %esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7ea:	8b 45 08             	mov    0x8(%ebp),%eax
{
 7ed:	53                   	push   %ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7ee:	8d 58 07             	lea    0x7(%eax),%ebx
 7f1:	c1 eb 03             	shr    $0x3,%ebx
 7f4:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 7f7:	85 c9                	test   %ecx,%ecx
 7f9:	74 65                	je     860 <malloc+0x80>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7fb:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 7fd:	8b 50 04             	mov    0x4(%eax),%edx
 800:	39 d3                	cmp    %edx,%ebx
 802:	77 1d                	ja     821 <malloc+0x41>
 804:	eb 2e                	jmp    834 <malloc+0x54>
 806:	8d 76 00             	lea    0x0(%esi),%esi
 809:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 810:	8b 30                	mov    (%eax),%esi
    if(p->s.size >= nunits){
 812:	8b 56 04             	mov    0x4(%esi),%edx
 815:	39 da                	cmp    %ebx,%edx
 817:	73 27                	jae    840 <malloc+0x60>
 819:	8b 0d 60 0d 00 00    	mov    0xd60,%ecx
 81f:	89 f0                	mov    %esi,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 821:	39 c1                	cmp    %eax,%ecx
 823:	75 eb                	jne    810 <malloc+0x30>
      if((p = morecore(nunits)) == 0)
 825:	89 d8                	mov    %ebx,%eax
 827:	e8 64 ff ff ff       	call   790 <morecore>
 82c:	85 c0                	test   %eax,%eax
 82e:	75 e0                	jne    810 <malloc+0x30>
        return 0;
  }
}
 830:	5b                   	pop    %ebx
 831:	5e                   	pop    %esi
 832:	5d                   	pop    %ebp
 833:	c3                   	ret    
    if(p->s.size >= nunits){
 834:	89 c6                	mov    %eax,%esi
 836:	89 c8                	mov    %ecx,%eax
 838:	90                   	nop
 839:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 840:	39 d3                	cmp    %edx,%ebx
 842:	74 4c                	je     890 <malloc+0xb0>
        p->s.size -= nunits;
 844:	29 da                	sub    %ebx,%edx
 846:	89 56 04             	mov    %edx,0x4(%esi)
        p += p->s.size;
 849:	8d 34 d6             	lea    (%esi,%edx,8),%esi
        p->s.size = nunits;
 84c:	89 5e 04             	mov    %ebx,0x4(%esi)
}
 84f:	5b                   	pop    %ebx
      freep = prevp;
 850:	a3 60 0d 00 00       	mov    %eax,0xd60
      return (void*)(p + 1);
 855:	8d 46 08             	lea    0x8(%esi),%eax
}
 858:	5e                   	pop    %esi
 859:	5d                   	pop    %ebp
 85a:	c3                   	ret    
 85b:	90                   	nop
 85c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 860:	c7 05 60 0d 00 00 64 	movl   $0xd64,0xd60
 867:	0d 00 00 
    base.s.size = 0;
 86a:	b9 64 0d 00 00       	mov    $0xd64,%ecx
    base.s.ptr = freep = prevp = &base;
 86f:	c7 05 64 0d 00 00 64 	movl   $0xd64,0xd64
 876:	0d 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 879:	89 c8                	mov    %ecx,%eax
    base.s.size = 0;
 87b:	c7 05 68 0d 00 00 00 	movl   $0x0,0xd68
 882:	00 00 00 
    if(p->s.size >= nunits){
 885:	eb 9a                	jmp    821 <malloc+0x41>
 887:	89 f6                	mov    %esi,%esi
 889:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        prevp->s.ptr = p->s.ptr;
 890:	8b 16                	mov    (%esi),%edx
 892:	89 10                	mov    %edx,(%eax)
 894:	eb b9                	jmp    84f <malloc+0x6f>
 896:	8d 76 00             	lea    0x0(%esi),%esi
 899:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000008a0 <malloc_wf>:

// modify malloc to implement 'worst fit' strategy
void*
malloc_wf(uint nbytes)
{
 8a0:	55                   	push   %ebp
 8a1:	89 e5                	mov    %esp,%ebp
 8a3:	57                   	push   %edi
 8a4:	56                   	push   %esi
 8a5:	53                   	push   %ebx
 8a6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp, *maxp, *maxprevp;
  uint nunits;
  uint max = 0;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8a9:	8b 45 08             	mov    0x8(%ebp),%eax
 8ac:	83 c0 07             	add    $0x7,%eax
 8af:	c1 e8 03             	shr    $0x3,%eax
 8b2:	83 c0 01             	add    $0x1,%eax
 8b5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 8b8:	90                   	nop
 8b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  if((prevp = freep) == 0){
 8c0:	8b 1d 60 0d 00 00    	mov    0xd60,%ebx
 8c6:	85 db                	test   %ebx,%ebx
 8c8:	74 66                	je     930 <malloc_wf+0x90>
 8ca:	8b 03                	mov    (%ebx),%eax
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }

  maxp = 0;
  maxprevp = 0;
 8cc:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  if((prevp = freep) == 0){
 8d3:	89 df                	mov    %ebx,%edi
  uint max = 0;
 8d5:	31 f6                	xor    %esi,%esi
  maxp = 0;
 8d7:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
 8de:	8b 50 04             	mov    0x4(%eax),%edx
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8e1:	eb 12                	jmp    8f5 <malloc_wf+0x55>
 8e3:	90                   	nop
 8e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p->s.size >= nunits && p->s.size > max){
      max = p->s.size;
      maxp = p;
      maxprevp = prevp;
    }
    if(p == freep)
 8e8:	39 d8                	cmp    %ebx,%eax
 8ea:	74 24                	je     910 <malloc_wf+0x70>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8ec:	8b 08                	mov    (%eax),%ecx
    if(p->s.size >= nunits && p->s.size > max){
 8ee:	89 c7                	mov    %eax,%edi
 8f0:	8b 51 04             	mov    0x4(%ecx),%edx
 8f3:	89 c8                	mov    %ecx,%eax
 8f5:	39 d6                	cmp    %edx,%esi
 8f7:	73 ef                	jae    8e8 <malloc_wf+0x48>
 8f9:	39 55 e4             	cmp    %edx,-0x1c(%ebp)
 8fc:	77 ea                	ja     8e8 <malloc_wf+0x48>
    if(p == freep)
 8fe:	39 d8                	cmp    %ebx,%eax
 900:	74 57                	je     959 <malloc_wf+0xb9>
 902:	89 7d dc             	mov    %edi,-0x24(%ebp)
 905:	89 d6                	mov    %edx,%esi
 907:	89 45 e0             	mov    %eax,-0x20(%ebp)
 90a:	eb e0                	jmp    8ec <malloc_wf+0x4c>
 90c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      break;
  }

  if(maxp != 0){
 910:	8b 45 e0             	mov    -0x20(%ebp),%eax
 913:	85 c0                	test   %eax,%eax
 915:	75 39                	jne    950 <malloc_wf+0xb0>
      p->s.size = nunits;
    }
    freep = prevp;
    return (void*)(p + 1);
  } else {
    if((p = morecore(nunits)) == 0)
 917:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 91a:	e8 71 fe ff ff       	call   790 <morecore>
 91f:	85 c0                	test   %eax,%eax
 921:	75 9d                	jne    8c0 <malloc_wf+0x20>
      return 0;
    return malloc_wf(nbytes);
  }
 923:	83 c4 1c             	add    $0x1c,%esp
 926:	5b                   	pop    %ebx
 927:	5e                   	pop    %esi
 928:	5f                   	pop    %edi
 929:	5d                   	pop    %ebp
 92a:	c3                   	ret    
 92b:	90                   	nop
 92c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 930:	c7 05 60 0d 00 00 64 	movl   $0xd64,0xd60
 937:	0d 00 00 
 93a:	c7 05 64 0d 00 00 64 	movl   $0xd64,0xd64
 941:	0d 00 00 
    base.s.size = 0;
 944:	c7 05 68 0d 00 00 00 	movl   $0x0,0xd68
 94b:	00 00 00 
  if(maxp != 0){
 94e:	eb c7                	jmp    917 <malloc_wf+0x77>
 950:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 953:	8b 7d dc             	mov    -0x24(%ebp),%edi
 956:	8b 53 04             	mov    0x4(%ebx),%edx
    if(p->s.size == nunits){
 959:	39 55 e4             	cmp    %edx,-0x1c(%ebp)
 95c:	74 1f                	je     97d <malloc_wf+0xdd>
      p->s.size -= nunits;
 95e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 961:	29 c2                	sub    %eax,%edx
 963:	89 53 04             	mov    %edx,0x4(%ebx)
      p = p + p->s.size;
 966:	8d 1c d3             	lea    (%ebx,%edx,8),%ebx
      p->s.size = nunits;
 969:	89 43 04             	mov    %eax,0x4(%ebx)
    freep = prevp;
 96c:	89 3d 60 0d 00 00    	mov    %edi,0xd60
 972:	83 c4 1c             	add    $0x1c,%esp
    return (void*)(p + 1);
 975:	8d 43 08             	lea    0x8(%ebx),%eax
 978:	5b                   	pop    %ebx
 979:	5e                   	pop    %esi
 97a:	5f                   	pop    %edi
 97b:	5d                   	pop    %ebp
 97c:	c3                   	ret    
      prevp->s.ptr = p->s.ptr;
 97d:	8b 03                	mov    (%ebx),%eax
 97f:	89 07                	mov    %eax,(%edi)
 981:	eb e9                	jmp    96c <malloc_wf+0xcc>
