<template>
  <div>
    <v-btn
      :active-class="activeClass"
      :block="block"
      :depressed="depressed"
      :disabled="disabled"
      :elevation="elevation"
      :height="height"
      :icon="icon"
      :large="large"
      :link="link"
      :href="href"
      :nuxt="nuxt"
      :outlined="outlined"
      :right="right"
      :rounded="rounded"
      :small="small"
      :to="to"
      :width="width"
      :text="text"
      :color="color"
      @click="copyText"
    >{{lable}}</v-btn>
    <input :id="id" :ref="id" :value="textToCopy" style="height:0px;width:0px;font-size:0px;" />
  </div>
</template>

<script>
/* eslint-disable */
import { mapActions } from 'vuex'
export default {
  name: 'CopyToClipboard',
  props: {
    id: {
      type: [String, Number],
      default: () => 'text-to-copy-' + parseInt(Math.random() * 1000)
    },
    beforeCopyText: {
      type: String,
      default: () => 'Copy'
    },
    afterCopyText: {
      type: String,
      default: () => 'Copied'
    },
    activeClass: {
      type: String,
      default: () => ''
    },
    block: {
      type: Boolean,
      default: () => false
    },
    depressed: {
      type: Boolean,
      default: () => false
    },
    disabled: {
      type: Boolean,
      default: () => false
    },
    elevation: {
      type: String,
      default: () => undefined
    },
    height: {
      type: String,
      default: () => undefined
    },
    icon: {
      type: Boolean,
      default: () => false
    },
    large: {
      type: Boolean,
      default: () => false
    },
    link: {
      type: String,
      default: () => undefined
    },
    href: {
      type: String,
      default: () => undefined
    },
    nuxt: {
      type: Boolean,
      default: () => false
    },
    outlined: {
      type: Boolean,
      default: () => false
    },
    right: {
      type: Boolean,
      default: () => false
    },
    rounded: {
      type: Boolean,
      default: () => false
    },
    small: {
      type: Boolean,
      default: () => false
    },
    to: {
      type: String,
      default: () => undefined
    },
    width: {
      type: String,
      default: () => undefined
    },
    color: {
      type: String,
      default: () => undefined
    },
    timeout: {
      type: Number,
      default: () => 1000
    },
    text: {
      type: Boolean,
      default: () => true
    },
    textToCopy: {
      type: String,
      default: () => 'sexy'
    }
  },
  mounted() {
    this.lable = this.beforeCopyText
  },
  data: function() {
    return {
      lable: ''
    }
  },
  methods: {
    ...mapActions({
      showSuccess: 'ui/showSuccessSnackbar',
      showError: 'ui/showErrorSnackbar'
    }),
    copyText: function() {
      let that = this
      this.lable = that.afterCopyText
      let testingCodeToCopy = this.$refs[this.id]
      testingCodeToCopy.setAttribute('type', 'text')
      testingCodeToCopy.select()
      try {
        var successful = document.execCommand('copy')
        if (successful) {
          this.showSuccess('Link copied successfully.')
        } else {
          this.showError('Oops, unable to copy.')
        }
      } catch (err) {
        this.showError('Oops, unable to copy.')
      }
      setTimeout(() => {
        that.lable = that.beforeCopyText
      }, that.timeout)
    }
  }
}
</script>

<style>
.main-font {
  font-family: 'ABeeZee', sans-serif;
}
</style>