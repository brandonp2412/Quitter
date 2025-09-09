package com.quitter.app

import android.graphics.drawable.GradientDrawable
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView

class AddictionAdapter(
    private val addictions: List<WidgetSelectionActivity.AddictionItem>,
    private val onItemClick: (WidgetSelectionActivity.AddictionItem) -> Unit
) : RecyclerView.Adapter<AddictionAdapter.AddictionViewHolder>() {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): AddictionViewHolder {
        val view = LayoutInflater.from(parent.context)
            .inflate(R.layout.item_addiction_selection, parent, false)
        return AddictionViewHolder(view)
    }

    override fun onBindViewHolder(holder: AddictionViewHolder, position: Int) {
        holder.bind(addictions[position])
    }

    override fun getItemCount(): Int = addictions.size

    inner class AddictionViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        private val titleText: TextView = itemView.findViewById(R.id.addiction_title)
        private val iconImage: ImageView = itemView.findViewById(R.id.addiction_icon)
        private val container: View = itemView.findViewById(R.id.addiction_container)

        fun bind(addiction: WidgetSelectionActivity.AddictionItem) {
            titleText.text = addiction.title
            iconImage.setImageResource(addiction.iconRes)

            // Create gradient background similar to Flutter
            val gradientDrawable = GradientDrawable(
                GradientDrawable.Orientation.TL_BR,
                intArrayOf(
                    addiction.color,
                    darkenColor(addiction.color, 0.3f) // Darker version
                )
            )
            gradientDrawable.cornerRadius = 16f
            container.background = gradientDrawable

            container.setOnClickListener {
                onItemClick(addiction)
            }
        }

        private fun darkenColor(color: Int, factor: Float): Int {
            val red = ((color shr 16) and 0xFF) * (1 - factor)
            val green = ((color shr 8) and 0xFF) * (1 - factor)
            val blue = (color and 0xFF) * (1 - factor)
            return (0xFF000000 or ((red.toInt() shl 16).toLong()) or ((green.toInt() shl 8).toLong()) or blue.toInt()
                .toLong()).toInt()
        }
    }
}