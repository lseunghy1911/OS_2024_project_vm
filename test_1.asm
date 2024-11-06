
_test_1:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "vm.h"

#define ELEMENTS (1 << 22)

int
main(int argc, char *argv[]) {
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
    struct mem_struct local_var = {0, 0, 0, 0, 0, 0, 0, 0};
   7:	31 c0                	xor    %eax,%eax
main(int argc, char *argv[]) {
   9:	ff 71 fc             	pushl  -0x4(%ecx)
   c:	55                   	push   %ebp
   d:	89 e5                	mov    %esp,%ebp
   f:	57                   	push   %edi
  10:	56                   	push   %esi
    struct mem_struct local_var = {0, 0, 0, 0, 0, 0, 0, 0};
  11:	8d 55 90             	lea    -0x70(%ebp),%edx
    struct mem_struct heap_var = {0, 0, 0, 0, 0, 0, 0, 0};
  14:	8d 75 bc             	lea    -0x44(%ebp),%esi
main(int argc, char *argv[]) {
  17:	53                   	push   %ebx
    struct mem_struct local_var = {0, 0, 0, 0, 0, 0, 0, 0};
  18:	89 d7                	mov    %edx,%edi
main(int argc, char *argv[]) {
  1a:	51                   	push   %ecx
    struct mem_struct local_var = {0, 0, 0, 0, 0, 0, 0, 0};
  1b:	b9 0b 00 00 00       	mov    $0xb,%ecx
main(int argc, char *argv[]) {
  20:	83 ec 74             	sub    $0x74,%esp
    
    int a = 5;
  23:	c7 45 8c 05 00 00 00 	movl   $0x5,-0x74(%ebp)
    struct mem_struct local_var = {0, 0, 0, 0, 0, 0, 0, 0};
  2a:	f3 ab                	rep stos %eax,%es:(%edi)
    struct mem_struct heap_var = {0, 0, 0, 0, 0, 0, 0, 0};
  2c:	b9 0b 00 00 00       	mov    $0xb,%ecx
  31:	89 f7                	mov    %esi,%edi
  33:	f3 ab                	rep stos %eax,%es:(%edi)

    uint *b = malloc(ELEMENTS * sizeof(uint));
  35:	68 00 00 00 01       	push   $0x1000000
  3a:	e8 d1 08 00 00       	call   910 <malloc>
  3f:	83 c4 10             	add    $0x10,%esp
  42:	8d 55 90             	lea    -0x70(%ebp),%edx
  45:	89 c3                	mov    %eax,%ebx
    for(int i = 0; i < ELEMENTS; i++) b[i] = 0;
  47:	8d 88 00 00 00 01    	lea    0x1000000(%eax),%ecx
  4d:	8d 76 00             	lea    0x0(%esi),%esi
  50:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  56:	83 c0 04             	add    $0x4,%eax
  59:	39 c8                	cmp    %ecx,%eax
  5b:	75 f3                	jne    50 <main+0x50>
    

    int status = walkpt(&local_var, (uint) &a);
  5d:	83 ec 08             	sub    $0x8,%esp
  60:	8d 45 8c             	lea    -0x74(%ebp),%eax
  63:	50                   	push   %eax
  64:	52                   	push   %edx
  65:	e8 c9 04 00 00       	call   533 <walkpt>
    if(status != 0){
  6a:	83 c4 10             	add    $0x10,%esp
  6d:	85 c0                	test   %eax,%eax
  6f:	0f 85 91 01 00 00    	jne    206 <main+0x206>
        printf(1, "systemcall error...\n");
    }
    printf(1, "Address translation parameters for local variable \"a\"\n");
  75:	83 ec 08             	sub    $0x8,%esp
  78:	68 58 0b 00 00       	push   $0xb58
  7d:	6a 01                	push   $0x1
  7f:	e8 6c 05 00 00       	call   5f0 <printf>
    printf(1, "\tVirtual address: 0x%x\n", local_var.va);
  84:	83 c4 0c             	add    $0xc,%esp
  87:	ff 75 90             	pushl  -0x70(%ebp)
  8a:	68 c9 0a 00 00       	push   $0xac9
  8f:	6a 01                	push   $0x1
  91:	e8 5a 05 00 00       	call   5f0 <printf>
    printf(1, "\tPage directory index: 0x%x, Page table index: 0x%x, Page offset: 0x%x\n", local_var.pd_index, local_var.pt_index, local_var.pg_offset);
  96:	59                   	pop    %ecx
  97:	ff 75 9c             	pushl  -0x64(%ebp)
  9a:	ff 75 98             	pushl  -0x68(%ebp)
  9d:	ff 75 94             	pushl  -0x6c(%ebp)
  a0:	68 90 0b 00 00       	push   $0xb90
  a5:	6a 01                	push   $0x1
  a7:	e8 44 05 00 00       	call   5f0 <printf>
    printf(1, "\tBase address of page directory: 0x%x\n", local_var.cr3);
  ac:	83 c4 1c             	add    $0x1c,%esp
  af:	ff 75 a0             	pushl  -0x60(%ebp)
  b2:	68 d8 0b 00 00       	push   $0xbd8
  b7:	6a 01                	push   $0x1
  b9:	e8 32 05 00 00       	call   5f0 <printf>
    printf(1, "\tAddress of PDE: 0x%x\n", local_var.pde);
  be:	83 c4 0c             	add    $0xc,%esp
  c1:	ff 75 a4             	pushl  -0x5c(%ebp)
  c4:	68 e1 0a 00 00       	push   $0xae1
  c9:	6a 01                	push   $0x1
  cb:	e8 20 05 00 00       	call   5f0 <printf>
    printf(1, "\tPPN inside PDE: 0x%x\n", local_var.ppn_pde);
  d0:	83 c4 0c             	add    $0xc,%esp
  d3:	ff 75 a8             	pushl  -0x58(%ebp)
  d6:	68 f8 0a 00 00       	push   $0xaf8
  db:	6a 01                	push   $0x1
  dd:	e8 0e 05 00 00       	call   5f0 <printf>
    printf(1, "\tBase address of page table (virtual): 0x%x\n", local_var.pgtab);
  e2:	83 c4 0c             	add    $0xc,%esp
  e5:	ff 75 ac             	pushl  -0x54(%ebp)
  e8:	68 00 0c 00 00       	push   $0xc00
  ed:	6a 01                	push   $0x1
  ef:	e8 fc 04 00 00       	call   5f0 <printf>
    printf(1, "\tAddress of PTE: 0x%x\n", local_var.pte);
  f4:	83 c4 0c             	add    $0xc,%esp
  f7:	ff 75 b0             	pushl  -0x50(%ebp)
  fa:	68 0f 0b 00 00       	push   $0xb0f
  ff:	6a 01                	push   $0x1
 101:	e8 ea 04 00 00       	call   5f0 <printf>
    printf(1, "\tPPN inside PTE: 0x%x\n", local_var.ppn_pte);
 106:	83 c4 0c             	add    $0xc,%esp
 109:	ff 75 b4             	pushl  -0x4c(%ebp)
 10c:	68 26 0b 00 00       	push   $0xb26
 111:	6a 01                	push   $0x1
 113:	e8 d8 04 00 00       	call   5f0 <printf>
    printf(1, "\tPhysical address: 0x%x\n", local_var.pa);
 118:	83 c4 0c             	add    $0xc,%esp
 11b:	ff 75 b8             	pushl  -0x48(%ebp)
 11e:	68 3d 0b 00 00       	push   $0xb3d
 123:	6a 01                	push   $0x1
 125:	e8 c6 04 00 00       	call   5f0 <printf>

    status = walkpt(&heap_var, (uint) &b[ELEMENTS - 1]);
 12a:	5f                   	pop    %edi
 12b:	58                   	pop    %eax
 12c:	8d 83 fc ff ff 00    	lea    0xfffffc(%ebx),%eax
 132:	50                   	push   %eax
 133:	56                   	push   %esi
 134:	e8 fa 03 00 00       	call   533 <walkpt>
    if(status != 0){
 139:	83 c4 10             	add    $0x10,%esp
 13c:	85 c0                	test   %eax,%eax
 13e:	0f 85 d8 00 00 00    	jne    21c <main+0x21c>
        printf(1, "systemcall error...\n");
    }
    printf(1, "Address translation parameters for heap variable \"b[ELEMENTS-1]\" \n");
 144:	83 ec 08             	sub    $0x8,%esp
 147:	68 30 0c 00 00       	push   $0xc30
 14c:	6a 01                	push   $0x1
 14e:	e8 9d 04 00 00       	call   5f0 <printf>
    printf(1, "\tVirtual address: 0x%x\n", heap_var.va);
 153:	83 c4 0c             	add    $0xc,%esp
 156:	ff 75 bc             	pushl  -0x44(%ebp)
 159:	68 c9 0a 00 00       	push   $0xac9
 15e:	6a 01                	push   $0x1
 160:	e8 8b 04 00 00       	call   5f0 <printf>
    printf(1, "\tPage directory index: 0x%x, Page table index: 0x%x, Page offset: 0x%x\n", heap_var.pd_index, heap_var.pt_index, heap_var.pg_offset);
 165:	58                   	pop    %eax
 166:	ff 75 c8             	pushl  -0x38(%ebp)
 169:	ff 75 c4             	pushl  -0x3c(%ebp)
 16c:	ff 75 c0             	pushl  -0x40(%ebp)
 16f:	68 90 0b 00 00       	push   $0xb90
 174:	6a 01                	push   $0x1
 176:	e8 75 04 00 00       	call   5f0 <printf>
    printf(1, "\tBase address of page directory: 0x%x\n", heap_var.cr3);
 17b:	83 c4 1c             	add    $0x1c,%esp
 17e:	ff 75 cc             	pushl  -0x34(%ebp)
 181:	68 d8 0b 00 00       	push   $0xbd8
 186:	6a 01                	push   $0x1
 188:	e8 63 04 00 00       	call   5f0 <printf>
    printf(1, "\tAddress of PDE: 0x%x\n", heap_var.pde);
 18d:	83 c4 0c             	add    $0xc,%esp
 190:	ff 75 d0             	pushl  -0x30(%ebp)
 193:	68 e1 0a 00 00       	push   $0xae1
 198:	6a 01                	push   $0x1
 19a:	e8 51 04 00 00       	call   5f0 <printf>
    printf(1, "\tPPN inside PDE: 0x%x\n", heap_var.ppn_pde);
 19f:	83 c4 0c             	add    $0xc,%esp
 1a2:	ff 75 d4             	pushl  -0x2c(%ebp)
 1a5:	68 f8 0a 00 00       	push   $0xaf8
 1aa:	6a 01                	push   $0x1
 1ac:	e8 3f 04 00 00       	call   5f0 <printf>
    printf(1, "\tBase address of page table (virtual): 0x%x\n", heap_var.pgtab);
 1b1:	83 c4 0c             	add    $0xc,%esp
 1b4:	ff 75 d8             	pushl  -0x28(%ebp)
 1b7:	68 00 0c 00 00       	push   $0xc00
 1bc:	6a 01                	push   $0x1
 1be:	e8 2d 04 00 00       	call   5f0 <printf>
    printf(1, "\tAddress of PTE: 0x%x\n", heap_var.pte);
 1c3:	83 c4 0c             	add    $0xc,%esp
 1c6:	ff 75 dc             	pushl  -0x24(%ebp)
 1c9:	68 0f 0b 00 00       	push   $0xb0f
 1ce:	6a 01                	push   $0x1
 1d0:	e8 1b 04 00 00       	call   5f0 <printf>
    printf(1, "\tPPN inside PTE: 0x%x\n", heap_var.ppn_pte);
 1d5:	83 c4 0c             	add    $0xc,%esp
 1d8:	ff 75 e0             	pushl  -0x20(%ebp)
 1db:	68 26 0b 00 00       	push   $0xb26
 1e0:	6a 01                	push   $0x1
 1e2:	e8 09 04 00 00       	call   5f0 <printf>
    printf(1, "\tPhysical address: 0x%x\n", heap_var.pa);
 1e7:	83 c4 0c             	add    $0xc,%esp
 1ea:	ff 75 e4             	pushl  -0x1c(%ebp)
 1ed:	68 3d 0b 00 00       	push   $0xb3d
 1f2:	6a 01                	push   $0x1
 1f4:	e8 f7 03 00 00       	call   5f0 <printf>

    free(b);
 1f9:	89 1c 24             	mov    %ebx,(%esp)
 1fc:	e8 2f 06 00 00       	call   830 <free>
 
    exit();
 201:	e8 8d 02 00 00       	call   493 <exit>
        printf(1, "systemcall error...\n");
 206:	50                   	push   %eax
 207:	50                   	push   %eax
 208:	68 b4 0a 00 00       	push   $0xab4
 20d:	6a 01                	push   $0x1
 20f:	e8 dc 03 00 00       	call   5f0 <printf>
 214:	83 c4 10             	add    $0x10,%esp
 217:	e9 59 fe ff ff       	jmp    75 <main+0x75>
        printf(1, "systemcall error...\n");
 21c:	52                   	push   %edx
 21d:	52                   	push   %edx
 21e:	68 b4 0a 00 00       	push   $0xab4
 223:	6a 01                	push   $0x1
 225:	e8 c6 03 00 00       	call   5f0 <printf>
 22a:	83 c4 10             	add    $0x10,%esp
 22d:	e9 12 ff ff ff       	jmp    144 <main+0x144>
 232:	66 90                	xchg   %ax,%ax
 234:	66 90                	xchg   %ax,%ax
 236:	66 90                	xchg   %ax,%ax
 238:	66 90                	xchg   %ax,%ax
 23a:	66 90                	xchg   %ax,%ax
 23c:	66 90                	xchg   %ax,%ax
 23e:	66 90                	xchg   %ax,%ax

00000240 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 240:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 241:	31 c0                	xor    %eax,%eax
{
 243:	89 e5                	mov    %esp,%ebp
 245:	53                   	push   %ebx
 246:	8b 4d 08             	mov    0x8(%ebp),%ecx
 249:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 24c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 250:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 254:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 257:	83 c0 01             	add    $0x1,%eax
 25a:	84 d2                	test   %dl,%dl
 25c:	75 f2                	jne    250 <strcpy+0x10>
    ;
  return os;
}
 25e:	89 c8                	mov    %ecx,%eax
 260:	5b                   	pop    %ebx
 261:	5d                   	pop    %ebp
 262:	c3                   	ret    
 263:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000270 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	53                   	push   %ebx
 274:	8b 4d 08             	mov    0x8(%ebp),%ecx
 277:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 27a:	0f b6 01             	movzbl (%ecx),%eax
 27d:	0f b6 1a             	movzbl (%edx),%ebx
 280:	84 c0                	test   %al,%al
 282:	75 1d                	jne    2a1 <strcmp+0x31>
 284:	eb 2a                	jmp    2b0 <strcmp+0x40>
 286:	8d 76 00             	lea    0x0(%esi),%esi
 289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 290:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 294:	83 c1 01             	add    $0x1,%ecx
 297:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 29a:	0f b6 1a             	movzbl (%edx),%ebx
 29d:	84 c0                	test   %al,%al
 29f:	74 0f                	je     2b0 <strcmp+0x40>
 2a1:	38 d8                	cmp    %bl,%al
 2a3:	74 eb                	je     290 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 2a5:	29 d8                	sub    %ebx,%eax
}
 2a7:	5b                   	pop    %ebx
 2a8:	5d                   	pop    %ebp
 2a9:	c3                   	ret    
 2aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2b0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 2b2:	29 d8                	sub    %ebx,%eax
}
 2b4:	5b                   	pop    %ebx
 2b5:	5d                   	pop    %ebp
 2b6:	c3                   	ret    
 2b7:	89 f6                	mov    %esi,%esi
 2b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002c0 <strlen>:

uint
strlen(const char *s)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 2c6:	80 3a 00             	cmpb   $0x0,(%edx)
 2c9:	74 15                	je     2e0 <strlen+0x20>
 2cb:	31 c0                	xor    %eax,%eax
 2cd:	8d 76 00             	lea    0x0(%esi),%esi
 2d0:	83 c0 01             	add    $0x1,%eax
 2d3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 2d7:	89 c1                	mov    %eax,%ecx
 2d9:	75 f5                	jne    2d0 <strlen+0x10>
    ;
  return n;
}
 2db:	89 c8                	mov    %ecx,%eax
 2dd:	5d                   	pop    %ebp
 2de:	c3                   	ret    
 2df:	90                   	nop
  for(n = 0; s[n]; n++)
 2e0:	31 c9                	xor    %ecx,%ecx
}
 2e2:	5d                   	pop    %ebp
 2e3:	89 c8                	mov    %ecx,%eax
 2e5:	c3                   	ret    
 2e6:	8d 76 00             	lea    0x0(%esi),%esi
 2e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002f0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	57                   	push   %edi
 2f4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2fa:	8b 45 0c             	mov    0xc(%ebp),%eax
 2fd:	89 d7                	mov    %edx,%edi
 2ff:	fc                   	cld    
 300:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 302:	89 d0                	mov    %edx,%eax
 304:	5f                   	pop    %edi
 305:	5d                   	pop    %ebp
 306:	c3                   	ret    
 307:	89 f6                	mov    %esi,%esi
 309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000310 <strchr>:

char*
strchr(const char *s, char c)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	8b 45 08             	mov    0x8(%ebp),%eax
 316:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 31a:	0f b6 10             	movzbl (%eax),%edx
 31d:	84 d2                	test   %dl,%dl
 31f:	75 12                	jne    333 <strchr+0x23>
 321:	eb 1d                	jmp    340 <strchr+0x30>
 323:	90                   	nop
 324:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 328:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 32c:	83 c0 01             	add    $0x1,%eax
 32f:	84 d2                	test   %dl,%dl
 331:	74 0d                	je     340 <strchr+0x30>
    if(*s == c)
 333:	38 d1                	cmp    %dl,%cl
 335:	75 f1                	jne    328 <strchr+0x18>
      return (char*)s;
  return 0;
}
 337:	5d                   	pop    %ebp
 338:	c3                   	ret    
 339:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 340:	31 c0                	xor    %eax,%eax
}
 342:	5d                   	pop    %ebp
 343:	c3                   	ret    
 344:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 34a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000350 <gets>:

char*
gets(char *buf, int max)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	57                   	push   %edi
 354:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 355:	31 f6                	xor    %esi,%esi
{
 357:	53                   	push   %ebx
 358:	89 f3                	mov    %esi,%ebx
 35a:	83 ec 1c             	sub    $0x1c,%esp
 35d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 360:	eb 2f                	jmp    391 <gets+0x41>
 362:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 368:	83 ec 04             	sub    $0x4,%esp
 36b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 36e:	6a 01                	push   $0x1
 370:	50                   	push   %eax
 371:	6a 00                	push   $0x0
 373:	e8 33 01 00 00       	call   4ab <read>
    if(cc < 1)
 378:	83 c4 10             	add    $0x10,%esp
 37b:	85 c0                	test   %eax,%eax
 37d:	7e 1c                	jle    39b <gets+0x4b>
      break;
    buf[i++] = c;
 37f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 383:	83 c7 01             	add    $0x1,%edi
 386:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 389:	3c 0a                	cmp    $0xa,%al
 38b:	74 23                	je     3b0 <gets+0x60>
 38d:	3c 0d                	cmp    $0xd,%al
 38f:	74 1f                	je     3b0 <gets+0x60>
  for(i=0; i+1 < max; ){
 391:	83 c3 01             	add    $0x1,%ebx
 394:	89 fe                	mov    %edi,%esi
 396:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 399:	7c cd                	jl     368 <gets+0x18>
 39b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 39d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 3a0:	c6 03 00             	movb   $0x0,(%ebx)
}
 3a3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3a6:	5b                   	pop    %ebx
 3a7:	5e                   	pop    %esi
 3a8:	5f                   	pop    %edi
 3a9:	5d                   	pop    %ebp
 3aa:	c3                   	ret    
 3ab:	90                   	nop
 3ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3b0:	8b 75 08             	mov    0x8(%ebp),%esi
 3b3:	8b 45 08             	mov    0x8(%ebp),%eax
 3b6:	01 de                	add    %ebx,%esi
 3b8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 3ba:	c6 03 00             	movb   $0x0,(%ebx)
}
 3bd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3c0:	5b                   	pop    %ebx
 3c1:	5e                   	pop    %esi
 3c2:	5f                   	pop    %edi
 3c3:	5d                   	pop    %ebp
 3c4:	c3                   	ret    
 3c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003d0 <stat>:

int
stat(const char *n, struct stat *st)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	56                   	push   %esi
 3d4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3d5:	83 ec 08             	sub    $0x8,%esp
 3d8:	6a 00                	push   $0x0
 3da:	ff 75 08             	pushl  0x8(%ebp)
 3dd:	e8 f1 00 00 00       	call   4d3 <open>
  if(fd < 0)
 3e2:	83 c4 10             	add    $0x10,%esp
 3e5:	85 c0                	test   %eax,%eax
 3e7:	78 27                	js     410 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 3e9:	83 ec 08             	sub    $0x8,%esp
 3ec:	ff 75 0c             	pushl  0xc(%ebp)
 3ef:	89 c3                	mov    %eax,%ebx
 3f1:	50                   	push   %eax
 3f2:	e8 f4 00 00 00       	call   4eb <fstat>
  close(fd);
 3f7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 3fa:	89 c6                	mov    %eax,%esi
  close(fd);
 3fc:	e8 ba 00 00 00       	call   4bb <close>
  return r;
 401:	83 c4 10             	add    $0x10,%esp
}
 404:	8d 65 f8             	lea    -0x8(%ebp),%esp
 407:	89 f0                	mov    %esi,%eax
 409:	5b                   	pop    %ebx
 40a:	5e                   	pop    %esi
 40b:	5d                   	pop    %ebp
 40c:	c3                   	ret    
 40d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 410:	be ff ff ff ff       	mov    $0xffffffff,%esi
 415:	eb ed                	jmp    404 <stat+0x34>
 417:	89 f6                	mov    %esi,%esi
 419:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000420 <atoi>:

int
atoi(const char *s)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	53                   	push   %ebx
 424:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 427:	0f be 02             	movsbl (%edx),%eax
 42a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 42d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 430:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 435:	77 1e                	ja     455 <atoi+0x35>
 437:	89 f6                	mov    %esi,%esi
 439:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 440:	83 c2 01             	add    $0x1,%edx
 443:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 446:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 44a:	0f be 02             	movsbl (%edx),%eax
 44d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 450:	80 fb 09             	cmp    $0x9,%bl
 453:	76 eb                	jbe    440 <atoi+0x20>
  return n;
}
 455:	89 c8                	mov    %ecx,%eax
 457:	5b                   	pop    %ebx
 458:	5d                   	pop    %ebp
 459:	c3                   	ret    
 45a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000460 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	57                   	push   %edi
 464:	8b 45 10             	mov    0x10(%ebp),%eax
 467:	8b 55 08             	mov    0x8(%ebp),%edx
 46a:	56                   	push   %esi
 46b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 46e:	85 c0                	test   %eax,%eax
 470:	7e 13                	jle    485 <memmove+0x25>
 472:	01 d0                	add    %edx,%eax
  dst = vdst;
 474:	89 d7                	mov    %edx,%edi
 476:	8d 76 00             	lea    0x0(%esi),%esi
 479:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    *dst++ = *src++;
 480:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 481:	39 f8                	cmp    %edi,%eax
 483:	75 fb                	jne    480 <memmove+0x20>
  return vdst;
}
 485:	5e                   	pop    %esi
 486:	89 d0                	mov    %edx,%eax
 488:	5f                   	pop    %edi
 489:	5d                   	pop    %ebp
 48a:	c3                   	ret    

0000048b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 48b:	b8 01 00 00 00       	mov    $0x1,%eax
 490:	cd 40                	int    $0x40
 492:	c3                   	ret    

00000493 <exit>:
SYSCALL(exit)
 493:	b8 02 00 00 00       	mov    $0x2,%eax
 498:	cd 40                	int    $0x40
 49a:	c3                   	ret    

0000049b <wait>:
SYSCALL(wait)
 49b:	b8 03 00 00 00       	mov    $0x3,%eax
 4a0:	cd 40                	int    $0x40
 4a2:	c3                   	ret    

000004a3 <pipe>:
SYSCALL(pipe)
 4a3:	b8 04 00 00 00       	mov    $0x4,%eax
 4a8:	cd 40                	int    $0x40
 4aa:	c3                   	ret    

000004ab <read>:
SYSCALL(read)
 4ab:	b8 05 00 00 00       	mov    $0x5,%eax
 4b0:	cd 40                	int    $0x40
 4b2:	c3                   	ret    

000004b3 <write>:
SYSCALL(write)
 4b3:	b8 10 00 00 00       	mov    $0x10,%eax
 4b8:	cd 40                	int    $0x40
 4ba:	c3                   	ret    

000004bb <close>:
SYSCALL(close)
 4bb:	b8 15 00 00 00       	mov    $0x15,%eax
 4c0:	cd 40                	int    $0x40
 4c2:	c3                   	ret    

000004c3 <kill>:
SYSCALL(kill)
 4c3:	b8 06 00 00 00       	mov    $0x6,%eax
 4c8:	cd 40                	int    $0x40
 4ca:	c3                   	ret    

000004cb <exec>:
SYSCALL(exec)
 4cb:	b8 07 00 00 00       	mov    $0x7,%eax
 4d0:	cd 40                	int    $0x40
 4d2:	c3                   	ret    

000004d3 <open>:
SYSCALL(open)
 4d3:	b8 0f 00 00 00       	mov    $0xf,%eax
 4d8:	cd 40                	int    $0x40
 4da:	c3                   	ret    

000004db <mknod>:
SYSCALL(mknod)
 4db:	b8 11 00 00 00       	mov    $0x11,%eax
 4e0:	cd 40                	int    $0x40
 4e2:	c3                   	ret    

000004e3 <unlink>:
SYSCALL(unlink)
 4e3:	b8 12 00 00 00       	mov    $0x12,%eax
 4e8:	cd 40                	int    $0x40
 4ea:	c3                   	ret    

000004eb <fstat>:
SYSCALL(fstat)
 4eb:	b8 08 00 00 00       	mov    $0x8,%eax
 4f0:	cd 40                	int    $0x40
 4f2:	c3                   	ret    

000004f3 <link>:
SYSCALL(link)
 4f3:	b8 13 00 00 00       	mov    $0x13,%eax
 4f8:	cd 40                	int    $0x40
 4fa:	c3                   	ret    

000004fb <mkdir>:
SYSCALL(mkdir)
 4fb:	b8 14 00 00 00       	mov    $0x14,%eax
 500:	cd 40                	int    $0x40
 502:	c3                   	ret    

00000503 <chdir>:
SYSCALL(chdir)
 503:	b8 09 00 00 00       	mov    $0x9,%eax
 508:	cd 40                	int    $0x40
 50a:	c3                   	ret    

0000050b <dup>:
SYSCALL(dup)
 50b:	b8 0a 00 00 00       	mov    $0xa,%eax
 510:	cd 40                	int    $0x40
 512:	c3                   	ret    

00000513 <getpid>:
SYSCALL(getpid)
 513:	b8 0b 00 00 00       	mov    $0xb,%eax
 518:	cd 40                	int    $0x40
 51a:	c3                   	ret    

0000051b <sbrk>:
SYSCALL(sbrk)
 51b:	b8 0c 00 00 00       	mov    $0xc,%eax
 520:	cd 40                	int    $0x40
 522:	c3                   	ret    

00000523 <sleep>:
SYSCALL(sleep)
 523:	b8 0d 00 00 00       	mov    $0xd,%eax
 528:	cd 40                	int    $0x40
 52a:	c3                   	ret    

0000052b <uptime>:
SYSCALL(uptime)
 52b:	b8 0e 00 00 00       	mov    $0xe,%eax
 530:	cd 40                	int    $0x40
 532:	c3                   	ret    

00000533 <walkpt>:
SYSCALL(walkpt)
 533:	b8 16 00 00 00       	mov    $0x16,%eax
 538:	cd 40                	int    $0x40
 53a:	c3                   	ret    
 53b:	66 90                	xchg   %ax,%ax
 53d:	66 90                	xchg   %ax,%ax
 53f:	90                   	nop

00000540 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 540:	55                   	push   %ebp
 541:	89 e5                	mov    %esp,%ebp
 543:	57                   	push   %edi
 544:	56                   	push   %esi
 545:	53                   	push   %ebx
 546:	83 ec 3c             	sub    $0x3c,%esp
 549:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 54c:	89 d1                	mov    %edx,%ecx
{
 54e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 551:	85 d2                	test   %edx,%edx
 553:	0f 89 7f 00 00 00    	jns    5d8 <printint+0x98>
 559:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 55d:	74 79                	je     5d8 <printint+0x98>
    neg = 1;
 55f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 566:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 568:	31 db                	xor    %ebx,%ebx
 56a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 56d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 570:	89 c8                	mov    %ecx,%eax
 572:	31 d2                	xor    %edx,%edx
 574:	89 cf                	mov    %ecx,%edi
 576:	f7 75 c4             	divl   -0x3c(%ebp)
 579:	0f b6 92 7c 0c 00 00 	movzbl 0xc7c(%edx),%edx
 580:	89 45 c0             	mov    %eax,-0x40(%ebp)
 583:	89 d8                	mov    %ebx,%eax
 585:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 588:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 58b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 58e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 591:	76 dd                	jbe    570 <printint+0x30>
  if(neg)
 593:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 596:	85 c9                	test   %ecx,%ecx
 598:	74 0c                	je     5a6 <printint+0x66>
    buf[i++] = '-';
 59a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 59f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 5a1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 5a6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 5a9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 5ad:	eb 07                	jmp    5b6 <printint+0x76>
 5af:	90                   	nop
 5b0:	0f b6 13             	movzbl (%ebx),%edx
 5b3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 5b6:	83 ec 04             	sub    $0x4,%esp
 5b9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 5bc:	6a 01                	push   $0x1
 5be:	56                   	push   %esi
 5bf:	57                   	push   %edi
 5c0:	e8 ee fe ff ff       	call   4b3 <write>
  while(--i >= 0)
 5c5:	83 c4 10             	add    $0x10,%esp
 5c8:	39 de                	cmp    %ebx,%esi
 5ca:	75 e4                	jne    5b0 <printint+0x70>
    putc(fd, buf[i]);
}
 5cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5cf:	5b                   	pop    %ebx
 5d0:	5e                   	pop    %esi
 5d1:	5f                   	pop    %edi
 5d2:	5d                   	pop    %ebp
 5d3:	c3                   	ret    
 5d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 5d8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 5df:	eb 87                	jmp    568 <printint+0x28>
 5e1:	eb 0d                	jmp    5f0 <printf>
 5e3:	90                   	nop
 5e4:	90                   	nop
 5e5:	90                   	nop
 5e6:	90                   	nop
 5e7:	90                   	nop
 5e8:	90                   	nop
 5e9:	90                   	nop
 5ea:	90                   	nop
 5eb:	90                   	nop
 5ec:	90                   	nop
 5ed:	90                   	nop
 5ee:	90                   	nop
 5ef:	90                   	nop

000005f0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5f0:	55                   	push   %ebp
 5f1:	89 e5                	mov    %esp,%ebp
 5f3:	57                   	push   %edi
 5f4:	56                   	push   %esi
 5f5:	53                   	push   %ebx
 5f6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5f9:	8b 75 0c             	mov    0xc(%ebp),%esi
 5fc:	0f b6 1e             	movzbl (%esi),%ebx
 5ff:	84 db                	test   %bl,%bl
 601:	0f 84 b8 00 00 00    	je     6bf <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 607:	8d 45 10             	lea    0x10(%ebp),%eax
 60a:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 60d:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 610:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 612:	89 45 d0             	mov    %eax,-0x30(%ebp)
 615:	eb 37                	jmp    64e <printf+0x5e>
 617:	89 f6                	mov    %esi,%esi
 619:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 620:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 623:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 628:	83 f8 25             	cmp    $0x25,%eax
 62b:	74 17                	je     644 <printf+0x54>
  write(fd, &c, 1);
 62d:	83 ec 04             	sub    $0x4,%esp
 630:	88 5d e7             	mov    %bl,-0x19(%ebp)
 633:	6a 01                	push   $0x1
 635:	57                   	push   %edi
 636:	ff 75 08             	pushl  0x8(%ebp)
 639:	e8 75 fe ff ff       	call   4b3 <write>
 63e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 641:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 644:	0f b6 1e             	movzbl (%esi),%ebx
 647:	83 c6 01             	add    $0x1,%esi
 64a:	84 db                	test   %bl,%bl
 64c:	74 71                	je     6bf <printf+0xcf>
    c = fmt[i] & 0xff;
 64e:	0f be cb             	movsbl %bl,%ecx
 651:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 654:	85 d2                	test   %edx,%edx
 656:	74 c8                	je     620 <printf+0x30>
      }
    } else if(state == '%'){
 658:	83 fa 25             	cmp    $0x25,%edx
 65b:	75 e7                	jne    644 <printf+0x54>
      if(c == 'd'){
 65d:	83 f8 64             	cmp    $0x64,%eax
 660:	0f 84 9a 00 00 00    	je     700 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 666:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 66c:	83 f9 70             	cmp    $0x70,%ecx
 66f:	74 5f                	je     6d0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 671:	83 f8 73             	cmp    $0x73,%eax
 674:	0f 84 d6 00 00 00    	je     750 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 67a:	83 f8 63             	cmp    $0x63,%eax
 67d:	0f 84 8d 00 00 00    	je     710 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 683:	83 f8 25             	cmp    $0x25,%eax
 686:	0f 84 b4 00 00 00    	je     740 <printf+0x150>
  write(fd, &c, 1);
 68c:	83 ec 04             	sub    $0x4,%esp
 68f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 693:	6a 01                	push   $0x1
 695:	57                   	push   %edi
 696:	ff 75 08             	pushl  0x8(%ebp)
 699:	e8 15 fe ff ff       	call   4b3 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 69e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 6a1:	83 c4 0c             	add    $0xc,%esp
 6a4:	6a 01                	push   $0x1
 6a6:	83 c6 01             	add    $0x1,%esi
 6a9:	57                   	push   %edi
 6aa:	ff 75 08             	pushl  0x8(%ebp)
 6ad:	e8 01 fe ff ff       	call   4b3 <write>
  for(i = 0; fmt[i]; i++){
 6b2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 6b6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 6b9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 6bb:	84 db                	test   %bl,%bl
 6bd:	75 8f                	jne    64e <printf+0x5e>
    }
  }
}
 6bf:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6c2:	5b                   	pop    %ebx
 6c3:	5e                   	pop    %esi
 6c4:	5f                   	pop    %edi
 6c5:	5d                   	pop    %ebp
 6c6:	c3                   	ret    
 6c7:	89 f6                	mov    %esi,%esi
 6c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        printint(fd, *ap, 16, 0);
 6d0:	83 ec 0c             	sub    $0xc,%esp
 6d3:	b9 10 00 00 00       	mov    $0x10,%ecx
 6d8:	6a 00                	push   $0x0
 6da:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 6dd:	8b 45 08             	mov    0x8(%ebp),%eax
 6e0:	8b 13                	mov    (%ebx),%edx
 6e2:	e8 59 fe ff ff       	call   540 <printint>
        ap++;
 6e7:	89 d8                	mov    %ebx,%eax
 6e9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6ec:	31 d2                	xor    %edx,%edx
        ap++;
 6ee:	83 c0 04             	add    $0x4,%eax
 6f1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6f4:	e9 4b ff ff ff       	jmp    644 <printf+0x54>
 6f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 700:	83 ec 0c             	sub    $0xc,%esp
 703:	b9 0a 00 00 00       	mov    $0xa,%ecx
 708:	6a 01                	push   $0x1
 70a:	eb ce                	jmp    6da <printf+0xea>
 70c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 710:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 713:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 716:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 718:	6a 01                	push   $0x1
        ap++;
 71a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 71d:	57                   	push   %edi
 71e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 721:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 724:	e8 8a fd ff ff       	call   4b3 <write>
        ap++;
 729:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 72c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 72f:	31 d2                	xor    %edx,%edx
 731:	e9 0e ff ff ff       	jmp    644 <printf+0x54>
 736:	8d 76 00             	lea    0x0(%esi),%esi
 739:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        putc(fd, c);
 740:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 743:	83 ec 04             	sub    $0x4,%esp
 746:	e9 59 ff ff ff       	jmp    6a4 <printf+0xb4>
 74b:	90                   	nop
 74c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 750:	8b 45 d0             	mov    -0x30(%ebp),%eax
 753:	8b 18                	mov    (%eax),%ebx
        ap++;
 755:	83 c0 04             	add    $0x4,%eax
 758:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 75b:	85 db                	test   %ebx,%ebx
 75d:	74 17                	je     776 <printf+0x186>
        while(*s != 0){
 75f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 762:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 764:	84 c0                	test   %al,%al
 766:	0f 84 d8 fe ff ff    	je     644 <printf+0x54>
 76c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 76f:	89 de                	mov    %ebx,%esi
 771:	8b 5d 08             	mov    0x8(%ebp),%ebx
 774:	eb 1a                	jmp    790 <printf+0x1a0>
          s = "(null)";
 776:	bb 74 0c 00 00       	mov    $0xc74,%ebx
        while(*s != 0){
 77b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 77e:	b8 28 00 00 00       	mov    $0x28,%eax
 783:	89 de                	mov    %ebx,%esi
 785:	8b 5d 08             	mov    0x8(%ebp),%ebx
 788:	90                   	nop
 789:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 790:	83 ec 04             	sub    $0x4,%esp
          s++;
 793:	83 c6 01             	add    $0x1,%esi
 796:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 799:	6a 01                	push   $0x1
 79b:	57                   	push   %edi
 79c:	53                   	push   %ebx
 79d:	e8 11 fd ff ff       	call   4b3 <write>
        while(*s != 0){
 7a2:	0f b6 06             	movzbl (%esi),%eax
 7a5:	83 c4 10             	add    $0x10,%esp
 7a8:	84 c0                	test   %al,%al
 7aa:	75 e4                	jne    790 <printf+0x1a0>
 7ac:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 7af:	31 d2                	xor    %edx,%edx
 7b1:	e9 8e fe ff ff       	jmp    644 <printf+0x54>
 7b6:	66 90                	xchg   %ax,%ax
 7b8:	66 90                	xchg   %ax,%ax
 7ba:	66 90                	xchg   %ax,%ax
 7bc:	66 90                	xchg   %ax,%ax
 7be:	66 90                	xchg   %ax,%ax

000007c0 <print_free_list>:
static Header base;
static Header *freep;

// print free list status
void
print_free_list(){
 7c0:	55                   	push   %ebp
 7c1:	89 e5                	mov    %esp,%ebp
 7c3:	53                   	push   %ebx
 7c4:	83 ec 0c             	sub    $0xc,%esp
  Header* p;
  printf(1, "Header -> ");
 7c7:	68 8d 0c 00 00       	push   $0xc8d
 7cc:	6a 01                	push   $0x1
 7ce:	e8 1d fe ff ff       	call   5f0 <printf>
  if(freep == 0){ 
 7d3:	a1 d4 0f 00 00       	mov    0xfd4,%eax
 7d8:	83 c4 10             	add    $0x10,%esp
 7db:	85 c0                	test   %eax,%eax
 7dd:	74 30                	je     80f <print_free_list+0x4f>
    printf(1, "NULL\n");
    return;
  }
  for(p = base.s.ptr; p != &base; p = p->s.ptr){
 7df:	8b 1d d8 0f 00 00    	mov    0xfd8,%ebx
 7e5:	81 fb d8 0f 00 00    	cmp    $0xfd8,%ebx
 7eb:	74 22                	je     80f <print_free_list+0x4f>
 7ed:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "%d -> ", p->s.size);
 7f0:	83 ec 04             	sub    $0x4,%esp
 7f3:	ff 73 04             	pushl  0x4(%ebx)
 7f6:	68 9e 0c 00 00       	push   $0xc9e
 7fb:	6a 01                	push   $0x1
 7fd:	e8 ee fd ff ff       	call   5f0 <printf>
  for(p = base.s.ptr; p != &base; p = p->s.ptr){
 802:	8b 1b                	mov    (%ebx),%ebx
 804:	83 c4 10             	add    $0x10,%esp
 807:	81 fb d8 0f 00 00    	cmp    $0xfd8,%ebx
 80d:	75 e1                	jne    7f0 <print_free_list+0x30>
    printf(1, "NULL\n");
 80f:	83 ec 08             	sub    $0x8,%esp
 812:	68 98 0c 00 00       	push   $0xc98
 817:	6a 01                	push   $0x1
 819:	e8 d2 fd ff ff       	call   5f0 <printf>
  }
  printf(1, "NULL\n");
}
 81e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 821:	c9                   	leave  
 822:	c3                   	ret    
 823:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 829:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000830 <free>:

void
free(void *ap)
{
 830:	55                   	push   %ebp
  Header *bp, *p;
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 831:	a1 d4 0f 00 00       	mov    0xfd4,%eax
{
 836:	89 e5                	mov    %esp,%ebp
 838:	57                   	push   %edi
 839:	56                   	push   %esi
 83a:	53                   	push   %ebx
 83b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 83e:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 840:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 843:	39 c8                	cmp    %ecx,%eax
 845:	73 19                	jae    860 <free+0x30>
 847:	89 f6                	mov    %esi,%esi
 849:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 850:	39 d1                	cmp    %edx,%ecx
 852:	72 14                	jb     868 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 854:	39 d0                	cmp    %edx,%eax
 856:	73 10                	jae    868 <free+0x38>
{
 858:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 85a:	8b 10                	mov    (%eax),%edx
 85c:	39 c8                	cmp    %ecx,%eax
 85e:	72 f0                	jb     850 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 860:	39 d0                	cmp    %edx,%eax
 862:	72 f4                	jb     858 <free+0x28>
 864:	39 d1                	cmp    %edx,%ecx
 866:	73 f0                	jae    858 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 868:	8b 73 fc             	mov    -0x4(%ebx),%esi
 86b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 86e:	39 fa                	cmp    %edi,%edx
 870:	74 1e                	je     890 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 872:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 875:	8b 50 04             	mov    0x4(%eax),%edx
 878:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 87b:	39 f1                	cmp    %esi,%ecx
 87d:	74 28                	je     8a7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 87f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 881:	5b                   	pop    %ebx
  freep = p;
 882:	a3 d4 0f 00 00       	mov    %eax,0xfd4
}
 887:	5e                   	pop    %esi
 888:	5f                   	pop    %edi
 889:	5d                   	pop    %ebp
 88a:	c3                   	ret    
 88b:	90                   	nop
 88c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 890:	03 72 04             	add    0x4(%edx),%esi
 893:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 896:	8b 10                	mov    (%eax),%edx
 898:	8b 12                	mov    (%edx),%edx
 89a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 89d:	8b 50 04             	mov    0x4(%eax),%edx
 8a0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8a3:	39 f1                	cmp    %esi,%ecx
 8a5:	75 d8                	jne    87f <free+0x4f>
    p->s.size += bp->s.size;
 8a7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 8aa:	a3 d4 0f 00 00       	mov    %eax,0xfd4
    p->s.size += bp->s.size;
 8af:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8b2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 8b5:	89 10                	mov    %edx,(%eax)
}
 8b7:	5b                   	pop    %ebx
 8b8:	5e                   	pop    %esi
 8b9:	5f                   	pop    %edi
 8ba:	5d                   	pop    %ebp
 8bb:	c3                   	ret    
 8bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000008c0 <morecore>:

static Header*
morecore(uint nu)
{
 8c0:	55                   	push   %ebp
 8c1:	89 e5                	mov    %esp,%ebp
 8c3:	53                   	push   %ebx
 8c4:	bb 00 10 00 00       	mov    $0x1000,%ebx
 8c9:	83 ec 10             	sub    $0x10,%esp
 8cc:	3d 00 10 00 00       	cmp    $0x1000,%eax
 8d1:	0f 43 d8             	cmovae %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 8d4:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 8db:	50                   	push   %eax
 8dc:	e8 3a fc ff ff       	call   51b <sbrk>
  if(p == (char*)-1)
 8e1:	83 c4 10             	add    $0x10,%esp
 8e4:	83 f8 ff             	cmp    $0xffffffff,%eax
 8e7:	74 1f                	je     908 <morecore+0x48>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 8e9:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8ec:	83 ec 0c             	sub    $0xc,%esp
 8ef:	83 c0 08             	add    $0x8,%eax
 8f2:	50                   	push   %eax
 8f3:	e8 38 ff ff ff       	call   830 <free>
  return freep;
 8f8:	a1 d4 0f 00 00       	mov    0xfd4,%eax
}
 8fd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  return freep;
 900:	83 c4 10             	add    $0x10,%esp
}
 903:	c9                   	leave  
 904:	c3                   	ret    
 905:	8d 76 00             	lea    0x0(%esi),%esi
 908:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return 0;
 90b:	31 c0                	xor    %eax,%eax
}
 90d:	c9                   	leave  
 90e:	c3                   	ret    
 90f:	90                   	nop

00000910 <malloc>:

void*
malloc(uint nbytes)
{
 910:	55                   	push   %ebp
  Header *p, *prevp;
  uint nunits;
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 911:	8b 0d d4 0f 00 00    	mov    0xfd4,%ecx
{
 917:	89 e5                	mov    %esp,%ebp
 919:	56                   	push   %esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 91a:	8b 45 08             	mov    0x8(%ebp),%eax
{
 91d:	53                   	push   %ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 91e:	8d 58 07             	lea    0x7(%eax),%ebx
 921:	c1 eb 03             	shr    $0x3,%ebx
 924:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 927:	85 c9                	test   %ecx,%ecx
 929:	74 65                	je     990 <malloc+0x80>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 92b:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 92d:	8b 50 04             	mov    0x4(%eax),%edx
 930:	39 d3                	cmp    %edx,%ebx
 932:	77 1d                	ja     951 <malloc+0x41>
 934:	eb 2e                	jmp    964 <malloc+0x54>
 936:	8d 76 00             	lea    0x0(%esi),%esi
 939:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 940:	8b 30                	mov    (%eax),%esi
    if(p->s.size >= nunits){
 942:	8b 56 04             	mov    0x4(%esi),%edx
 945:	39 da                	cmp    %ebx,%edx
 947:	73 27                	jae    970 <malloc+0x60>
 949:	8b 0d d4 0f 00 00    	mov    0xfd4,%ecx
 94f:	89 f0                	mov    %esi,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 951:	39 c1                	cmp    %eax,%ecx
 953:	75 eb                	jne    940 <malloc+0x30>
      if((p = morecore(nunits)) == 0)
 955:	89 d8                	mov    %ebx,%eax
 957:	e8 64 ff ff ff       	call   8c0 <morecore>
 95c:	85 c0                	test   %eax,%eax
 95e:	75 e0                	jne    940 <malloc+0x30>
        return 0;
  }
}
 960:	5b                   	pop    %ebx
 961:	5e                   	pop    %esi
 962:	5d                   	pop    %ebp
 963:	c3                   	ret    
    if(p->s.size >= nunits){
 964:	89 c6                	mov    %eax,%esi
 966:	89 c8                	mov    %ecx,%eax
 968:	90                   	nop
 969:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 970:	39 d3                	cmp    %edx,%ebx
 972:	74 4c                	je     9c0 <malloc+0xb0>
        p->s.size -= nunits;
 974:	29 da                	sub    %ebx,%edx
 976:	89 56 04             	mov    %edx,0x4(%esi)
        p += p->s.size;
 979:	8d 34 d6             	lea    (%esi,%edx,8),%esi
        p->s.size = nunits;
 97c:	89 5e 04             	mov    %ebx,0x4(%esi)
}
 97f:	5b                   	pop    %ebx
      freep = prevp;
 980:	a3 d4 0f 00 00       	mov    %eax,0xfd4
      return (void*)(p + 1);
 985:	8d 46 08             	lea    0x8(%esi),%eax
}
 988:	5e                   	pop    %esi
 989:	5d                   	pop    %ebp
 98a:	c3                   	ret    
 98b:	90                   	nop
 98c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 990:	c7 05 d4 0f 00 00 d8 	movl   $0xfd8,0xfd4
 997:	0f 00 00 
    base.s.size = 0;
 99a:	b9 d8 0f 00 00       	mov    $0xfd8,%ecx
    base.s.ptr = freep = prevp = &base;
 99f:	c7 05 d8 0f 00 00 d8 	movl   $0xfd8,0xfd8
 9a6:	0f 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9a9:	89 c8                	mov    %ecx,%eax
    base.s.size = 0;
 9ab:	c7 05 dc 0f 00 00 00 	movl   $0x0,0xfdc
 9b2:	00 00 00 
    if(p->s.size >= nunits){
 9b5:	eb 9a                	jmp    951 <malloc+0x41>
 9b7:	89 f6                	mov    %esi,%esi
 9b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        prevp->s.ptr = p->s.ptr;
 9c0:	8b 16                	mov    (%esi),%edx
 9c2:	89 10                	mov    %edx,(%eax)
 9c4:	eb b9                	jmp    97f <malloc+0x6f>
 9c6:	8d 76 00             	lea    0x0(%esi),%esi
 9c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000009d0 <malloc_wf>:

// modify malloc to implement 'worst fit' strategy
void*
malloc_wf(uint nbytes)
{
 9d0:	55                   	push   %ebp
 9d1:	89 e5                	mov    %esp,%ebp
 9d3:	57                   	push   %edi
 9d4:	56                   	push   %esi
 9d5:	53                   	push   %ebx
 9d6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp, *maxp, *maxprevp;
  uint nunits;
  uint max = 0;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9d9:	8b 45 08             	mov    0x8(%ebp),%eax
 9dc:	83 c0 07             	add    $0x7,%eax
 9df:	c1 e8 03             	shr    $0x3,%eax
 9e2:	83 c0 01             	add    $0x1,%eax
 9e5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 9e8:	90                   	nop
 9e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  if((prevp = freep) == 0){
 9f0:	8b 1d d4 0f 00 00    	mov    0xfd4,%ebx
 9f6:	85 db                	test   %ebx,%ebx
 9f8:	74 66                	je     a60 <malloc_wf+0x90>
 9fa:	8b 03                	mov    (%ebx),%eax
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }

  maxp = 0;
  maxprevp = 0;
 9fc:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  if((prevp = freep) == 0){
 a03:	89 df                	mov    %ebx,%edi
  uint max = 0;
 a05:	31 f6                	xor    %esi,%esi
  maxp = 0;
 a07:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
 a0e:	8b 50 04             	mov    0x4(%eax),%edx
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a11:	eb 12                	jmp    a25 <malloc_wf+0x55>
 a13:	90                   	nop
 a14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p->s.size >= nunits && p->s.size > max){
      max = p->s.size;
      maxp = p;
      maxprevp = prevp;
    }
    if(p == freep)
 a18:	39 d8                	cmp    %ebx,%eax
 a1a:	74 24                	je     a40 <malloc_wf+0x70>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a1c:	8b 08                	mov    (%eax),%ecx
    if(p->s.size >= nunits && p->s.size > max){
 a1e:	89 c7                	mov    %eax,%edi
 a20:	8b 51 04             	mov    0x4(%ecx),%edx
 a23:	89 c8                	mov    %ecx,%eax
 a25:	39 d6                	cmp    %edx,%esi
 a27:	73 ef                	jae    a18 <malloc_wf+0x48>
 a29:	39 55 e4             	cmp    %edx,-0x1c(%ebp)
 a2c:	77 ea                	ja     a18 <malloc_wf+0x48>
    if(p == freep)
 a2e:	39 d8                	cmp    %ebx,%eax
 a30:	74 57                	je     a89 <malloc_wf+0xb9>
 a32:	89 7d dc             	mov    %edi,-0x24(%ebp)
 a35:	89 d6                	mov    %edx,%esi
 a37:	89 45 e0             	mov    %eax,-0x20(%ebp)
 a3a:	eb e0                	jmp    a1c <malloc_wf+0x4c>
 a3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      break;
  }

  if(maxp != 0){
 a40:	8b 45 e0             	mov    -0x20(%ebp),%eax
 a43:	85 c0                	test   %eax,%eax
 a45:	75 39                	jne    a80 <malloc_wf+0xb0>
      p->s.size = nunits;
    }
    freep = prevp;
    return (void*)(p + 1);
  } else {
    if((p = morecore(nunits)) == 0)
 a47:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 a4a:	e8 71 fe ff ff       	call   8c0 <morecore>
 a4f:	85 c0                	test   %eax,%eax
 a51:	75 9d                	jne    9f0 <malloc_wf+0x20>
      return 0;
    return malloc_wf(nbytes);
  }
 a53:	83 c4 1c             	add    $0x1c,%esp
 a56:	5b                   	pop    %ebx
 a57:	5e                   	pop    %esi
 a58:	5f                   	pop    %edi
 a59:	5d                   	pop    %ebp
 a5a:	c3                   	ret    
 a5b:	90                   	nop
 a5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 a60:	c7 05 d4 0f 00 00 d8 	movl   $0xfd8,0xfd4
 a67:	0f 00 00 
 a6a:	c7 05 d8 0f 00 00 d8 	movl   $0xfd8,0xfd8
 a71:	0f 00 00 
    base.s.size = 0;
 a74:	c7 05 dc 0f 00 00 00 	movl   $0x0,0xfdc
 a7b:	00 00 00 
  if(maxp != 0){
 a7e:	eb c7                	jmp    a47 <malloc_wf+0x77>
 a80:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 a83:	8b 7d dc             	mov    -0x24(%ebp),%edi
 a86:	8b 53 04             	mov    0x4(%ebx),%edx
    if(p->s.size == nunits){
 a89:	39 55 e4             	cmp    %edx,-0x1c(%ebp)
 a8c:	74 1f                	je     aad <malloc_wf+0xdd>
      p->s.size -= nunits;
 a8e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 a91:	29 c2                	sub    %eax,%edx
 a93:	89 53 04             	mov    %edx,0x4(%ebx)
      p = p + p->s.size;
 a96:	8d 1c d3             	lea    (%ebx,%edx,8),%ebx
      p->s.size = nunits;
 a99:	89 43 04             	mov    %eax,0x4(%ebx)
    freep = prevp;
 a9c:	89 3d d4 0f 00 00    	mov    %edi,0xfd4
 aa2:	83 c4 1c             	add    $0x1c,%esp
    return (void*)(p + 1);
 aa5:	8d 43 08             	lea    0x8(%ebx),%eax
 aa8:	5b                   	pop    %ebx
 aa9:	5e                   	pop    %esi
 aaa:	5f                   	pop    %edi
 aab:	5d                   	pop    %ebp
 aac:	c3                   	ret    
      prevp->s.ptr = p->s.ptr;
 aad:	8b 03                	mov    (%ebx),%eax
 aaf:	89 07                	mov    %eax,(%edi)
 ab1:	eb e9                	jmp    a9c <malloc_wf+0xcc>
